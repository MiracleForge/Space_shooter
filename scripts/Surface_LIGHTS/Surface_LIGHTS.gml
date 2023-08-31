// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
/*
function optimizeSurfaceCreation(surfaceFormat)
{
    var appSurfaceWidth = surface_get_width(application_surface);
    var appSurfaceHeight = surface_get_height(application_surface);
   
    // Verifica se a surface surf_light já existe
    if (!surface_exists(surf_light))
    { 
        surf_light = surface_create(appSurfaceWidth, appSurfaceHeight, surfaceFormat);
    }
   
        // Redimensiona a surf_light se suas dimensões forem diferentes da application surface
        var surfWidth = surface_get_width(surf_light);
        var surfHeight = surface_get_height(surf_light);
        
        if (surfWidth != appSurfaceWidth || surfHeight != appSurfaceHeight)
        {
			
            surface_resize(surf_light, appSurfaceWidth, appSurfaceHeight);
        }

}
/*
function //scr_create_light(_x, _y, _colour, _intensity, _xscale, _yscale, _target = -10)
{
    var light = instance_create_depth(_x, _y, 0, Olight);
    light.argument = [x=_x, y=_y]
	light.image_blend = _colour;
    light.image_xscale = _xscale;
    light.image_yscale = _yscale;
    light.image_alpha = _intensity;
    light.target = _target;
}
*/


   /// @function        scr_blend_light(_area,_particles,_lengdir,_xscale,_yscale,_angle,_colour,_alpha, _glow)
   /// @param {real} _area area around the obj or angle 90 to 360
   /// @param {real}  _particles  quantity of objects add around the glowing obj
   /// @param {real} _lengdir  where the particles begin and end
   /// @param {real} _xscale  x scale of glow particles - default image_xscale
   /// @param {real} _yscale  y scale of glow particles - default image_yscale
   /// @param {real} _angle  angleof the glow - default image_angle
   /// @param {constant.colour} _colour  angleof the glow - - default image_blend
   /// @param {real} _alpha  alpha 
   /// @param {bool} _glow  glow true or false
function scr_blend_light(_area,_particles,_lengdir,_xscale,_yscale,_angle,_colour,_alpha,_glow)
{
	
   ///@description  this script is responsible for drawing an area around the object
   ///            responsible for the light load glow
     if Ogame.light_mode_light == false
    {
		return
	}
 var _glow_max = 0.5 + (1 + sin(2 + pi * current_time / 1000 * 0.10)) * 0.8; // 0.5 - 1.3
// first number controls intensite and 1000 * number control velocit

        gpu_set_blendmode(bm_add);
        for (B = 0; B < _area; B += _particles)
        {
            var draw_alpha = _glow ? (_glow_max * _alpha) : _alpha;
            draw_sprite_ext(sprite_index, image_index,
                x + lengthdir_x(_lengdir, B), y + lengthdir_y(_lengdir, B),
                _xscale, _yscale, _angle, _colour, draw_alpha);
        }
        gpu_set_blendmode(bm_normal);
    
}