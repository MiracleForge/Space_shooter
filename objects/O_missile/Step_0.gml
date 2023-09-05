/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
switch (missil_lockON)
{
    case missil_state.off_line:
        if (!lock_missil && !is_undefined(global.possible_targets))
        {
            var _allenemy = Oenemy_parent;

            if (target_enemy == noone)
            {
                var player_direction = O_player_parent.direction;
                var angle_limit_upper = player_direction + 80;
                var angle_limit_lower = player_direction - 80;

                for (var i = 0; i < instance_number(_allenemy); i++)
                {
                    var _target_enemy = instance_find(_allenemy, i);

                    var angle_to_enemy = point_direction(x, y, _target_enemy.x, _target_enemy.y);
                    var _angle_difference = angle_difference(player_direction, angle_to_enemy);

                    if (abs(_angle_difference) <= 80)
                    {
                        if (!_target_enemy.is_targeted)
                        {
                            ds_list_add(global.possible_targets, _target_enemy);
                            _target_enemy.is_targeted = true;
                        }
                    }
                }

                if (ds_list_size(global.possible_targets) > 0)
                {
                    var random_target_index = irandom(ds_list_size(global.possible_targets) - 1);
                    target_enemy = ds_list_find_value(global.possible_targets, random_target_index);
                    missil_lockON = missil_state.following;
                    lock_missil = true;
                    ds_list_delete(global.possible_targets, random_target_index);
                }
            }
        }
        break;

    case missil_state.following:
        if (instance_exists(target_enemy) && target_enemy != noone)
        {
			if instance_exists(O_player_parent)
			{
            var _target_direc = point_direction(x, y, target_enemy.x, target_enemy.y);
            direction = _target_direc;

            // Verifica se o alvo ainda está dentro do ângulo de visão do jogador
          
			var player_direction = O_player_parent.x;

            var _angle_diff = angle_difference(player_direction, point_direction(O_player_parent.x, O_player_parent.y, target_enemy.x, target_enemy.y));

            if (abs(_angle_diff) > 80)
            {
                // Se o alvo estiver fora do ângulo de visão, continue perseguindo-o
                var move_speed = 6; // Defina a velocidade de perseguição adequada
                move_towards_point(target_enemy.x, target_enemy.y, move_speed);
            }
			image_angle = direction;
        }
		}
        break;
}





