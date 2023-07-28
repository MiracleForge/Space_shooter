/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();
   var _ship = O_ship_parent;
   var dist = 30; // Distância desejada do jogador
  
  if (alarm[0] == -1) // time to shoot again
{
		alarm[0] = 	120
}
  if Pyexist
  {
   var dest_x = _ship.x;
   var dest_y = _ship.y;	
   var dir_to_player = point_direction(x, y, dest_x, dest_y);
   
	image_angle = dir_to_player;
	direction = image_angle;

		 if enemy_direction == false {
	 
			speed = 1.8; // Velocidade da nave
			hspeed = 2.4;
		 }else {	
	 
			speed = 1.8; // Velocidade da nave
			hspeed = -2.4;
		 }

		 var new_x = x + lengthdir_x(speed, image_angle);
		 var new_y = y + lengthdir_y(speed, -image_angle);
			
			x = new_x;
			y = new_y;
   }


