/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var _ship = O_ship_parent;

if chasing and distance_to_object(_ship) <= 80 {
	var _dir_to_player = point_direction(x, y, _ship.x,_ship.y);
	  if ( y <= _ship.y) {
        hspeed = lengthdir_x(3, _dir_to_player);
        vspeed = lengthdir_y(3, _dir_to_player);

	        if (alarm[0] == -1) {
	            alarm[0] = 30;
			}
	  }
}else {
// do nothing;	
}














