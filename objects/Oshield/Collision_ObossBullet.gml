/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var _ship = O_ship_parent;
var _Pyshield = _ship.shield;
var decreaseAmount = 5;
var shieldToDecrease = min(O_ship_parent.shield, decreaseAmount);

if O_ship_parent.shield >0
{
	O_ship_parent.shield -= shieldToDecrease;
	visible = true;
    alarm[0]= 180;
	with(other)
{	
	instance_destroy();
}
}