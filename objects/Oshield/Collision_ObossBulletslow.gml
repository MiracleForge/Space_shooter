/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor



if  _ship.shield_active and O_player_parent.shield >0
{
	O_player_parent.shield -=1;
	O_player_parent.move_speed -=1
	visible = true;
    alarm[0]= 180;
	with(other)
		{	
			instance_destroy();
		}
}