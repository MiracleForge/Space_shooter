/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if instance_exists(O_ship_parent)
{
var _ship_x = O_ship_parent.x;
var _ship_y = O_ship_parent.y
var pushing = point_direction(x,y,_ship_x,_ship_y);
speed = 4;
direction = pushing;
}
meteor_hp -= 3;