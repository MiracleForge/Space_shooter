/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Variáveis da mina


switch (minestates)
{
    case STATES_MINE.UNARMED:
        if (speed >= 0)
        {
            speed -= 0.05;	
        }
        
        if (speed == 0)
        {
            minestates = STATES_MINE.ARMED;
        }
    break;
    
    case STATES_MINE.ARMED:
        vspeed = 1;
        // na distancia a mina avisa o jogador do perigo
        if (distance_to_object(O_ship_parent) <= close_distance)
        {
          effect_create_above(ef_flare,x,y,0.5,c_white)
        }
		// caso esteja na distancia ,a mina explode
	        else if (distance_to_object(O_ship_parent) <= detonation_distance)
	        {
				//activate colision with ship
			   explosion_range = true;   
			  if  (O_ship_parent.take_damage == true)
				{
					effect_create_above(ef_explosion,x,y, 1, c_red);
					instance_destroy();	
				}
               
	        }
    break;
}

