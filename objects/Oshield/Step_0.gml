/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
  var _ship = O_player_parent;
if !instance_exists(_ship)
{	
    instance_destroy();
}
else
{
  
    
    x = _ship.x + lengthdir_x(-30, _ship.direction);
    y = _ship.y + lengthdir_y(-30, _ship.direction);
    
    direction = _ship.direction;
    image_angle = _ship.direction;
    
    if _ship.shield <= 0
    {	
        visible = false;
    }
}

