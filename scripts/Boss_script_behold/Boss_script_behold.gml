// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
/*
function scr_BossAttack_aleatory(){
var dest_x = irandom_range(50, 680);
var dest_y = irandom_range(50, 600);
var veloc = 5; // Velocidade de movimento

var walking = false; // Variável de controle para indicar se está andando

// Dentro do evento Step do objeto
if (!walking) {
	if !instance_exists(ObossShield)
	{
		instance_create_layer(x,y,"layer_under", ObossShield);
	}
	if !instance_exists(Ofate)
	{
	
		var _inst = instance_create_layer(x, y, "Instances", Ofate);
		    _inst.sprite_index = sprite_index;
			_inst.image_xscale = image_xscale;
			_inst.image_yscale = image_yscale;
	}
	
    var destiny = distance_to_point(dest_x, dest_y);
    var _direction = point_direction(x, y, dest_x, dest_y);

    h_speed = lengthdir_x(veloc, _direction);
    v_speed = lengthdir_y(veloc, _direction);
	
    if (destiny <= veloc) {
        x = dest_x;
        y = dest_y;
        walking = false;

        // Escolher novo destino
        dest_x = irandom_range(50, 680);
        dest_y = irandom_range(50, 600);
    } else {
        walking = true;
		if alarm[0] == -1
		{
			alarm[0] = 30;	
		}
    }
}
}