//Descrição: Este script contém as ações relacionadas aos ataques especiais do jogador.
function scr_special_default()
{
		// do nothing 	
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
	}
		       

}

	
