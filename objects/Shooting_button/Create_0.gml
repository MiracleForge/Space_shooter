/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

input = function(_touch_id, _touch_x, _touch_y)
{	
	
	if alarm[0] == -1 and instance_exists(O_player_parent){
	O_player_parent.shoot_on = true;
	alarm[0] = 10;
	}
}