//Descrição: Este script contém as ações relacionadas aos ataques especiais do jogador.
function scr_special_default()
{
		// do nothing 	
}

function scr_miscelanios_distribuition_special()
{
	var _slot1 = Ogame.special_slot1;
	var _slot2 = Ogame.special_slot2;
	var _slot3 = Ogame.special_slot3;
		if _slot1
	{
		var _find_special = ds_list_find_value(powers_list,0);
		if  _find_special == spr_Missile
		{
			player_special_attack = scr_special_missil;
		}
		if  _find_special == Spr_white_scolt
		{
			player_special_attack = scr_special_scoult;
		}
		powers_list[|0] = -1;
	}else if _slot2
	{
		var _find_special = ds_list_find_value(powers_list,1);
		if  _find_special == spr_Missile
		{
			player_special_attack = scr_special_missil;
		}
		if  _find_special == Spr_white_scolt
		{
			player_special_attack = scr_special_scoult;
		}
		powers_list[|1] = -1;
	}else if _slot3
	{
		var _find_special = ds_list_find_value(powers_list,2);
		if  _find_special == spr_Missile
		{
			player_special_attack = scr_special_missil;
		}
		if  _find_special == Spr_white_scolt
		{
			player_special_attack = scr_special_scoult;
		}
		powers_list[|2] = -1;
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
        alarm[3] = 260; // Inicie o alarme
    }
    else
    {
        if (alarmActive)
        {
            // Contar regressivamente o alarme
            alarm[3] -= 1;

            // Verificar se o alarme disparou
            if (alarm[3] <= -1)
            {
                show_message("oi");
                player_special_attack = scr_special_default;
                special_timer = 0;
                Ogame.special_slot1 = false;
                Ogame.special_slot2 = false;
                Ogame.special_slot3 = false;
                instance_destroy(Owhite_scoult);
                alarm[3] = -1;
                // Desative a variável de controle para sair do script
                alarmActive = false;
            }
        }

        // Se você quiser continuar com alguma outra lógica enquanto o alarme está contando
        // Coloque-a aqui dentro deste bloco condicional.
    }
}



