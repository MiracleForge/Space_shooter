/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
//player's End Step


	if allow_damage and alarm[1] == -1 {

	    var _inst_collid_with = instance_place(x, y, O_parent_colition_with_player);
	    if (_inst_collid_with != noone) {

	                switch (_inst_collid_with.collision_type) {
	                    case 1:
	                        current_life = 0; // kill player
	                        Ogame.alarm[0] = 120; // restart room
	                        break;
	                    case 2:
	                        alarm[1] = 300;
	                        current_life -= 1;
	                        break;
	                    case 3:
	                        instance_destroy(_inst_collid_with);
	                        alarm[1] = 300;
	                        current_life -= 1;
	                        break;
	                }
	            }
	        }  
/*  /// coliding with only closest projectiel
if allow_damage and alarm[1] == -1 {
	// Defina a distância máxima para verificar a colisão (ajuste conforme necessário)
	var max_distance = 100; // Ajuste a distância máxima desejada

	// Verifique se há colisões apenas se o jogador estiver em um determinado raio
	if (point_distance(x, y, O_player_parent.x, O_player_parent.y) <= max_distance) {
	    var _inst_collid_with = instance_position(x, y, O_parent_colition_with_player);
    
	    if (_inst_collid_with != noone) {

		                switch (_inst_collid_with.collision_type) {
		                    case 1:
		                        current_life = 0; // kill player
		                        Ogame.alarm[0] = 120; // restart room
		                        break;
		                    case 2:
		                        alarm[1] = 300;
		                        current_life -= 1;
		                        break;
		                    case 3:
		                        instance_destroy(_inst_collid_with);
		                        alarm[1] = 300;
		                        current_life -= 1;
		                        break;
		                }
		            }
		        }  
	}




