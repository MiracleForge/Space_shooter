/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var _ship = O_player_parent;
if instance_exists(_ship)
{
    x = (_ship.x - 50) + lengthdir_x(-30, _ship.direction);
    y = _ship.y + lengthdir_y(-30, _ship.direction);
    
    direction = _ship.direction;
    image_angle = _ship.direction;
}
if alarm[0] == -1
{
	var _enemy = point_direction(x,y,Oenemy_parent.x , Oenemy_parent.y);
var _minion_gun = instance_create_layer(x,y,"Instances",O_missile);
	_minion_gun.direction = O_player_parent.direction;
	_minion_gun.speed = -4;
	_minion_gun.image_angle = direction;
	_minion_gun.sprite_index = Spr_minion_gun;
	alarm[0] = 30;
}












