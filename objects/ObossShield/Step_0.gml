/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if instance_exists(O_boss_beholder) and O_boss_beholder.attkState == BOOSshot_state.aleatory
{
 var _ship = O_boss_beholder;
 image_yscale = -image_yscale;
    
    x = _ship.x + lengthdir_x(-30, _ship.direction);
    y = _ship.y + lengthdir_y(100, _ship.direction);
    
    direction = _ship.direction;
    image_angle = _ship.direction;
	
	
}else
	{	
	instance_destroy();
	}