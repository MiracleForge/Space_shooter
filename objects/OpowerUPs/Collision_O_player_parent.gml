/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Declara uma variável chamada powerUpIndex e atribui a ela o valor arredondado de OpowerUPs.image_index
var powerUpIndex = round(OpowerUPs.image_index);
OpowerUPs.spark = true;
// Executa o seguinte código com o contexto do objeto O_player_parent
with (O_player_parent) {
    // Incrementa a variável current_life em 1, aumentando a vida do jogador
  

    // Verifica se powerUpIndex é igual a 0 ou (powerUpIndex é igual a 1 e shield_active é verdadeiro)
    if (powerUpIndex == 0 and current_life < max_life )
	{
		  current_life += 1;
	}
	if (powerUpIndex == 1 && shield_active) {
        // Se powerUpIndex for igual a 1, verifica se o escudo está ativo
       
            // Se o escudo estiver ativo, adiciona até 10 pontos de escudo, limitado a max_shield
            shield += min(10, max_shield - shield); 
			current_life += min((max_life/3), max_life - current_life);
        
    }

    // Verifica se powerUpIndex é igual a 2 e se o escudo está ativo
    if (powerUpIndex == 2 && shield_active) {
        // Se ambas as condições forem verdadeiras, define o escudo como o valor máximo, max_shield
        shield = max_shield;
		current_life = max_life;
    }
}
instance_create_layer(O_player_parent.x, O_player_parent.y, "Instances", Ospark);
instance_destroy();














