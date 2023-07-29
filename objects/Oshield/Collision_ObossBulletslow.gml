/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


var _ship = O_ship_parent;
if O_ship_parent.shield >0
{
	O_ship_parent.shield -=1;
	O_ship_parent.move_speed -=1
	visible = true;
    alarm[0]= 180;
	with(other)
		{	
			instance_destroy();
		}
}