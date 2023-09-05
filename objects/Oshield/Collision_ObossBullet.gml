/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var _ship = O_player_parent;
var _Pyshield = _ship.shield;
var decreaseAmount = 5;
var shieldToDecrease = min(O_player_parent.shield, decreaseAmount);

if _ship.shield_active and _ship.shield >0
{
	_ship.shield -= shieldToDecrease;
	visible = true;
    alarm[0]= 180;
	with(other)
{	
	instance_destroy();
}
}