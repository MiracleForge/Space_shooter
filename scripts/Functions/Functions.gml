// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_create_light(_x, _y,_colour, _intensity,_xscale, _yscale, _target = -10){
	 var light = instance_create_depth(_x,_y,0,Olight);
	 light.image_blend = _colour;
	 light.image_xscale = _xscale;
	 light.image_yscale = _yscale;
	 light.image_alpha = _intensity;
	 light.target = _target;
}