/// @description Inserir descrição aqui
// start definitions to move player ship
#region// start all players scripts and functions;
script_execute(player_shield_state); // start shield 
// Se não estiver definido, defina-o como o resultado da função scr_normal_player_moviment()
player_movement_state = scr_normal_player_moviment();
////
if special_attk 
{
	
 script_execute(player_special_attack);	
}
////
if keyboard_check_pressed(ord("S"))
{
	special_attk = !special_attk;	
}
// Verifique se a tecla de espaço foi pressionada e o alarm[0] não está ativo, ou se shoot_on está ativado
if (keyboard_check_pressed(vk_space) && Shooting_button.alarm[0] == -1 || shoot_on) {
 
    // Verifique se a variável overheat é falsa (não sobreaquecida)
    if (!overheat && (heat <= max_heat)) { // alarm 2 CAN SHOOT? YES SHOOT , NO DON'T HEAT UP PS : alarm 2(set in attk scripts) can't never be greater than alarm 1
		{
			if (alarm[2] = -1)
			{
				heat += 1;
				alarm[0] = 120; // Sistema de resfriamento mantendo alarm[0] desligado até que o jogador pare de atirar
		        // Execute o script player_normal_attack
		        script_execute(player_normal_attack); // Execute o script no evento de criação de cada nave
			}
		}
    } else {
		
        // Execute o script player_overheat_attack
        script_execute(player_overheat_attack);
    }
}
#endregion

#region // Check the overheating region and cooling system

// Check if alarm[0] is disabled
if (alarm[0] == -1) {

    // Check if the heat has reached or exceeded the maximum allowed
    if (heat >= max_heat) {
        overheat = true; // Activate overheating
        alarm[0] = heat_capacity; // Set the alarm to control heat capacity
    } else if (!overheat && heat >= 0) {
        heat -= time_to_cooling; // Gradually cool down the heat (adjust the factor to control the cooling speed)
        // Check if the heat has dropped below zero
        if (heat < 0) {
            heat = 0; // Keep the heat at the minimum (zero)
        }
    }
}

// End of the overheating and cooling system check region
#endregion

#region //destroy ship
if current_life <= 0 {	
	audio_play_sound(snd_Game_over_ship,0,false);
    effect_create_above(ef_firework, x,y,0.1,c_white);
	instance_destroy();
	instance_destroy(Oengine);
    instance_destroy(Oshield);
	ds_list_destroy(powers_list);
	Ogame.alarm[0] =	120;// restart game
	}
#endregion








