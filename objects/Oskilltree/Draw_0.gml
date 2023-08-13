/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
//image_blend = color;

sprite_index = branch_sprite;
draw_self();

if lock_skill
{
	image_speed = 0;
    var skill_width = sprite_get_width(sprite_index);
    var skill_height = sprite_get_height(sprite_index);

    // Desenha a sprite do planeta

   
    // Desenha a sprite do cadeado 
    var skill_scale_x = skill_width / sprite_get_width(Spr_lock);
    var skill_scale_y = skill_height / sprite_get_height(Spr_lock);
	
    draw_sprite_ext(Spr_lock, 0, x, y, skill_scale_x/5, skill_scale_y/5, 0, c_black, 1);
}else
{
		image_speed = -1;
		scr_blend_light(360,50,6,image_xscale,image_yscale,image_angle,image_blend,0.05,false)
}







