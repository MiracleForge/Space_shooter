/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var _ship = O_player_parent;
if _ship.shield_active and _ship.shield >0
{
	_ship.shield -=1;
	visible = true;
    alarm[0]= 180;
	with(other)
		{	
			instance_destroy();
		}
}