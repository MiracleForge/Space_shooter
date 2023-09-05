/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
event_inherited();
var some_threshold_value = 10;

switch (missil_lockON) {
    case missil_state.off_line:
        // Verifica se o míssil já está perseguindo um inimigo
        if (target_enemy == noone) {
            if (instance_exists(O_player_parent) && O_player_parent.overheat == true) {
                if (target_enemy == noone) {
                    var _enemy = Oenemy_parent;
                    // Encontra um inimigo disponível para perseguir
                    if (instance_count > 0) {
                        // Escolhe aleatoriamente uma instância de inimigo
                        var random_index = irandom(instance_count - 1);
                        target_enemy = instance_find(_enemy, random_index);
                        is_targeting_enemy = true;
                    }
                }
                missil_lockON = missil_state.following;
            }
        }
        break;

    case missil_state.following:
        // Verifica se o míssil está perseguindo um inimigo
        if (instance_exists(target_enemy)) {
			var dest_x = target_enemy.x;
			var dest_y = target_enemy.y
            var _dir = point_direction(x, y, dest_x, dest_y);

            if (distance_to_object(target_enemy) > some_threshold_value) {

                hspeed = lengthdir_x(speed, _dir);
                vspeed = lengthdir_y(speed, _dir);
                direction = _dir;
                image_angle = -_dir;
                speed = -7;
            } else {
                // O inimigo foi alcançado, redefine o alvo para liberar o míssil
                target_enemy = noone;
                is_targeting_enemy = false;
                missil_lockON = missil_state.explod;
            }
        } else {
            missil_lockON = missil_state.no_target;
        }
        break;

    case missil_state.no_target:
        direction = direction;
        image_angle = direction;
    
        break;
}



