// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações



	
	/*
	function optimizeSurfaceCreation(surfaceFormat)
{
    if (!surface_exists(surf_light))
    {
        var _wid = surface_get_width(application_surface);
        var _hei = surface_get_height(application_surface);
        surf_light = surface_create(_wid, _hei, surfaceFormat);
    }
}
*/


function scr_text(_text)
{
		text[page_number] = _text;
		page_number ++;
}

function scr_create_text_id(_text_id, _sprite)
{
	with(instance_create_depth(0,0, -9999,OtextControl))
		{
			scr_gametext(_text_id,_sprite)
		}
}
function scr_gametext(_text_id, _sprite)
{	
	switch (_text_id)
	{
	    case "AIDE":
	        scr_text(" Ajuda a caminho");
	        break;
		
	    case "Capitao":
	        scr_text(" Atencao capitao, nossa inteligencia nos informou da presenca de uma nava não identificada vindo em nossa direcao");
	        break;
	}
	switch (_sprite)
	{
	    case 0:
	        Ospeak.spriteicon = Spr_HUI_general
	    break;
	    case 1:
	        Ospeak.spriteicon = Spr_hui_aide
	    break;
		
	 
	}	

}