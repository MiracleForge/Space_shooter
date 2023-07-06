// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_create_light(_x, _y, _colour, _intensity, _xscale, _yscale, _target = -10)
{
    var light = instance_create_depth(_x, _y, 0, Olight);
    light.argument = [x=_x, y=_y]
	light.image_blend = _colour;
    light.image_xscale = _xscale;
    light.image_yscale = _yscale;
    light.image_alpha = _intensity;
    light.target = _target;
}

	
	
	function optimizeSurfaceCreation(surfaceFormat)
{
    if (!surface_exists(surf_light))
    {
        var _wid = surface_get_width(application_surface);
        var _hei = surface_get_height(application_surface);
        surf_light = surface_create(_wid, _hei, surfaceFormat);
    }
}

function scr_text(_text)
{
		text[page_number] = _text;
		page_number ++;
}

function scr_create_text_id(_text_id)
{
	with(instance_create_depth(0,0, -9999,OtextControl))
		{
			scr_gametext(_text_id)
		}
}
function scr_gametext(_text_id)
{	
	switch (_text_id)
	{
	    case "AIDE":
	        scr_text(" Ajuda a caminho");
	        scr_text(" Capitao ajuda chegou");
	        break;
		
	    case "Capitao":
	        scr_text(" Atencao capitao, nossa inteligencia nos informou da presenca de uma nava não identificada vindo em nossa direcao");
	        scr_text(" bazzinga");
	        break;
	}

}