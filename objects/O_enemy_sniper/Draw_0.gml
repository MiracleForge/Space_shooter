/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

draw_self();
if movState == SNIPER.CHARGING and !instance_exists(O_enemy_lazer) 
{
    var _scale_range =  1.8;
    var _angle = image_angle; // Obtém o ângulo do objeto atual

    var _sprite_width = sprite_get_width(spr_particle_sprite);
    var _sprite_height = sprite_get_height(spr_particle_sprite);
    
    var _draw_x = (x +45) + lengthdir_x(+20, _angle) - (_sprite_width * _scale_range * 0.5);
    var _draw_y = y + lengthdir_y(80, _angle) - (_sprite_height * _scale_range * 0.5);

    draw_sprite_ext(spr_particle_sprite, image_index ++, _draw_x, _draw_y, _scale_range, _scale_range, _angle, c_white,image_alpha++);
}

switch (movState)
{
	case SNIPER.WALK:
	  draw_text(x - 40, y, "State: walk");
	  break;
	case SNIPER.CHARGING:
	  draw_text(x - 40, y, "State: chargin");
	  break;
	case SNIPER.STEALTH:
	  draw_text(x - 40, y, "State: steath");
	  break;
}



