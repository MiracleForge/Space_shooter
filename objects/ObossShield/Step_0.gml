/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

 var _ship = O_boss_beholder;
 if instance_exists(_ship)
 {

 image_yscale = -image_yscale;
    
    x = _ship.x + lengthdir_x(-30, _ship.direction);
    y = _ship.y + lengthdir_y(100, _ship.direction);
    
    direction = _ship.direction;
    image_angle = _ship.direction;
	
 }else 
 {
	instance_destroy();	 
 }



