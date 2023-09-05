/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if instance_exists(O_player_parent)
{
	var _ship_x = O_player_parent.x;
	var _ship_y = O_player_parent.y
	var pushing = point_direction(x,y,_ship_x,_ship_y);
	speed = 4;
	direction = pushing;
}
meteor_hp -= 3;