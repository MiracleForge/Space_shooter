/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Variáveis para guardar referências a objetos do jogo
var _ship = O_ship_parent;      
var _sniper = O_enemy_sniper;     
    

// Verifica se o objeto da nave do jogador (_ship) existe antes de continuar
if !instance_exists(_ship) 
{
	return;
}
	var _Pyshield = _ship.shield; 
    // Configura a posição do objeto como a posição do inimigo sniper
    x = _sniper.x;
    y = _sniper.y;

    // Calcula a direção do sniper em relação à nave do jogador
    direction = point_direction(_sniper.x, _sniper.y, _ship.x, _ship.y);

    // Calcula o comprimento máximo do lazer (tiro) com uma margem de 20 pixels
    var max_length = distance_to_object(_ship) + 20;

    // Loop para verificar colisões do lazer com o escudo do jogador
    for (var i = 0; i < max_length; i++) {
        xEnd = x + lengthdir_x(i, direction);
        yEnd = y + lengthdir_y(i, direction);
        lenght_lazer = i;

        // Verifica se houve colisão do lazer com o objeto de escudo (Oshield) e se o escudo ainda possui energia (_Pyshield >= 0)
        if collision_point(xEnd, yEnd, Oshield, 1, 0) and _Pyshield >= 0 {
            // Caso a colisão seja confirmada e o escudo ainda tenha energia, realiza o seguinte:
            with (Oshield) {
                var decreaseAmount = 10; // Valor a ser subtraído do escudo

                // Verifica se o escudo é maior que 0 para aplicar a redução de energia
                if (_ship.shield > 0) {
                    // Subtrai apenas o valor existente de energia do escudo (_Pyshield) ou o valor total do decreaseAmount, o que for menor
                    var shieldToDecrease = min(_Pyshield, decreaseAmount);
                    _ship.shield -= shieldToDecrease; // Reduz a energia do escudo
                    alarm[0] = 180; // Configura um alarme para o escudo ficar visível por um tempo
                    visible = true; // Torna o objeto de escudo visível
                    
                }
            }
            instance_destroy(O_enemy_lazer); // Destroi o lazer após a colisão com o escudo
            break; // Sai do loop após a colisão com o escudo
        }
        
        // Verifica se houve colisão do lazer com o objeto da nave do jogador (O_ship_parent)
        if collision_point(xEnd, yEnd, O_ship_parent, 1, 0) {
            // Caso a colisão seja confirmada:
            with(O_ship_parent) {
                if (take_damage == true) {
                    alarm[2] = 100;   // Configura um alarme para a nave piscar (levou dano)
                    take_damage = false; // Define a variável de dano como false para que o dano não seja reaplicado imediatamente
                    life_ship -= 1; // Reduz a vida da nave do jogador em 1 ponto
                }
            }
			O_enemy_sniper.movState = SNIPER.STEALTH;
            instance_destroy(O_enemy_lazer); // Destroi o lazer após a colisão com a nave do jogador
            break; // Sai do loop após a colisão com a nave do jogador
        }
    }

    // Verifica se existe pelo menos um objeto do tipo O_enemy_parent no jogo
if instance_exists(O_enemy_parent) {
    var _list = ds_list_create(); // Cria uma lista temporária para guardar os objetos inimigos atingidos
    var _hits = collision_line_list(x, y, xEnd, yEnd, O_enemy_parent, 0, 0, _list, 0); // Lista objetos inimigos atingidos

    if (_hits > 0) {
       
        for (var k = 0; k < _hits; ++k) {
            var _enemy_hit = _list[|k];
            if (_enemy_hit != id) {
                if (_enemy_hit.object_index == O_enemy_sniper) {
                    continue; // Ignora este objeto e passa para o próximo da lista
                }
                instance_destroy(_enemy_hit);
            }
        }

        ds_list_destroy(_list); // Destroi a lista temporária de objetos inimigos
        effect_create_above(ef_explosion, x, y, 0.1, c_orange); // Cria um efeito de explosão acima do ponto de colisão
    }
}


// Verifica se não existe mais o objeto do inimigo sniper ou se o alarme 0 está configurado como -1 (quando a nave do jogador está destruída)
if (!instance_exists(_sniper) or alarm[0] == -1) {
    instance_destroy(); // Destroi o objeto atual (O_enemy_lazer)
	O_enemy_sniper.movState = SNIPER.STEALTH;
}
