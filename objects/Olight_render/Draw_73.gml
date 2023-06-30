/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


if (surface_format_is_supported(surface_rgba16float))
{
    optimizeSurfaceCreation(surface_rgba16float);
}
else
{
    optimizeSurfaceCreation(surface_rgba8unorm);
}

surface_set_target(surf_light);

draw_clear(ambient_light);

camera_apply(view_camera[0]);
gpu_set_blendmode(bm_add);
with (Olight)
{
    var _int = floor(image_alpha);
    repeat (_int)
    {	
        draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 1);
    }
    
}
gpu_set_blendmode(bm_normal);

surface_reset_target();


