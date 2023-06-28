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
	image_xscale = 3;
	image_yscale = 3;

	} else 
	{	
	image_xscale = 4;
	image_yscale = 4;
		}
		
	x = _ship.x + lengthdir_x(1, _ship.direction);
	y = _ship.y + lengthdir_y(0.5, _ship.direction);	
if _ship.x == 0 {
    sprite_index = spr_engineoff;
} else {
    sprite_index = spr_engineOn;
}
	
direction = _ship.direction;
image_angle = _ship.direction;
}else {	
	instance_destroy();
	}
	