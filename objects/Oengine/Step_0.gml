/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var _ship = undefined;

if instance_exists(O_USS_Cerulean) {
    _ship = O_USS_Cerulean;
} else if instance_exists(O_USS_Emberstrike) {
    _ship = O_USS_Emberstrike;
}

// Usar o valor da variável _ship em outras partes do código

if instance_exists(_ship){

	if _ship ==	O_USS_Cerulean
	{
	image_xscale = 5;
	image_yscale = 5;

	} else 
	{	
	image_xscale = 6;
	image_yscale = 6;
	}
		


if (room == rm_Hightspeed) {
	
    sprite_index = spr_engine_speed;
	if !instance_exists(Olight)
	{
		if (surface_format_is_supported(surface_rgba16float))
		{
			//scr_create_light(x ,y,c_aqua,1.2,1,1,id);
		}	
	}
} else if (_ship.x == 0) {
    sprite_index = spr_engineoff;
} else {
    sprite_index = spr_engineOn;
}


x = _ship.x + lengthdir_x(1, _ship.direction);
y = _ship.y + lengthdir_y(0.5, _ship.direction);
	
direction = _ship.direction;
image_angle = _ship.direction;


}else {	
	instance_destroy();
	}
	