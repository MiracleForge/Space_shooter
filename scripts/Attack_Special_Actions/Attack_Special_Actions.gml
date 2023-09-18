//Descrição: Este script contém as ações relacionadas aos ataques especiais do jogador.
function scr_special_default()
{
		// do nothing 	
}

/// @function scr_miscelanios_distribuition_special
/// @description This function goes through the variables looking for special slots clicked on by the player, if found, it assigns the sprite value of that slot to a specific script
function scr_miscelanios_distribuition_special()
{
    var special_slots = [Ogame.special_slot1, Ogame.special_slot2, Ogame.special_slot3];
    
    for (var i = 0; i < array_length(special_slots); i++) // scrolls through all slot variables looking for their contents
    {
        if (special_slots[i] && !special_active)  // if a slot has been pressed but the control is active, it does not work
        {
            var find_special = ds_list_find_value(powers_list, i); //associates the clicked slot with the index of the list corresponding to the slot
            var special_attack = noone;
            
            switch (find_special) // each script corresponds to a sprit that is within the ds_list
            {
                case spr_Missile:
                    special_attack = scr_special_missil;
                    break;
                case Spr_white_scolt:
                    special_attack = scr_special_scoult;
                    break;
                case spr_shock_wave:
                    special_attack = scr_special_shockwave;
                    break;
                default:
                    // Caso nenhum especial seja encontrado, faça alguma ação padrão (se necessário).
                    break;
            }
            
            if (special_attack != noone)
            {
                player_special_attack = special_attack;
                powers_list[| i] = -1; // deletes the index
                special_active = true; // turn on control to unlock player click 
                break; // Sai do loop assim que encontrar um especial válido.
            }
        }
    }
}


function scr_special_missil()
{	 
	
	var i = 0;

		while ((i < 10) and alarm[3] == -1)
		{

				var _random_x_origin, _random_y_origin;
					_random_x_origin = random(720);
					_random_y_origin = 1280;
		
				var _spc = instance_create_depth(_random_x_origin, _random_y_origin, -1000, O_missile);
				    _spc.image_xscale = 6;
				    _spc.image_yscale = 6;
					_spc.direction = 270;
					_spc.image_angle = 270;
					_spc.speed = -4;
				
					i++;
					special_timer +=1;
					alarm[3] = 60;
		}
	
	if special_timer = 10
	{
		player_special_attack = scr_special_default;
		special_timer = 0;
		Ogame.special_slot1 = false;
		Ogame.special_slot2 = false;
		Ogame.special_slot3 = false;
		special_active = false;
	}
		       

}

// Defina uma variável de controle para rastrear o estado do alarme
var alarmActive = true;

function scr_special_scoult()
{
    if !instance_exists(Owhite_scoult)
    {
        instance_create_layer(O_player_parent.x - 30, O_player_parent.y, "Instances", Owhite_scoult);
        alarmActive = true; // Ative a variável de controle quando a instância for criada
        alarm[3] = 1600; // Inicie o alarme
    }
    else
    {
        if (alarmActive)
        {
            // Contar regressivamente o alarme
            alarm[3] -= 1 / delta_time;

            // Verificar se o alarme disparou
            if (alarm[3] <= -1)
            {
               
                player_special_attack = scr_special_default;
                special_timer = 0;
                Ogame.special_slot1 = false;
                Ogame.special_slot2 = false;
                Ogame.special_slot3 = false;
                instance_destroy(Owhite_scoult);
                alarm[3] = -1;
                // Desative a variável de controle para sair do script
                alarmActive = false;
				special_active = false;
            }
        }

        // Se você quiser continuar com alguma outra lógica enquanto o alarme está contando
        // Coloque-a aqui dentro deste bloco condicional.
    }
}

function scr_special_shockwave()
{
	var i = 0;

		while ((i < 20) and alarm[3] == -1)
		{

		var _shockwave = instance_create_layer(x,y,"Instances", O_shockwave);
				_shockwave.speed = -8;
			_shockwave.direction = direction;
			_shockwave.image_angle = direction +45;
			alarm[3] = 30;
				
			i++;
			special_timer +=1;
			alarm[3] = 60;
		}
		
	if special_timer = 20
	{
		player_special_attack = scr_special_default;
		special_timer = 0;
		Ogame.special_slot1 = false;
		Ogame.special_slot2 = false;
		Ogame.special_slot3 = false;
		special_active = false;
	}

		
}

