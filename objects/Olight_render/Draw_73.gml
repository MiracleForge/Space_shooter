/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (!surface_exists(surf_light))
{
	var _wid = surface_get_width(application_surface);
	var _hei = surface_get_height(application_surface);
	surf_light = surface_create(_wid,_hei, surface_rgba16float);
}

surface_set_target(surf_light);

	draw_clear(ambient_light);
	
	camera_apply(view_camera[0]);
	gpu_set_blendmode(bm_add);
	 with(Olight)
	 {
		//draw_self();
		var _int = floor(image_alpha);
			repeat(_int)
				{	
					draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,1);
				}
		var _frac = frac(image_alpha);
		draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,_frac);
	 }
		//draw_sprite_ext(spr_light,0,mouse_x,mouse_y, 3,3,0,c_purple,1);
	
	gpu_set_blendmode(bm_normal);
	

surface_reset_target()