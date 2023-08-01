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