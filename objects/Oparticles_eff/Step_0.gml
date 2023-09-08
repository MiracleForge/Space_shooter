/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _ship = O_player_parent;
if instance_exists(O_player_parent)
{
	x = _ship.x;
	y = _ship.y;
if Ojoystick.joy_x != 0 and Ojoystick.joy_y !=0 
{
		eff_system = part_system_create();
		eff_type = part_type_create();
		emitter = part_emitter_create(eff_system);

		part_type_shape(eff_type,pt_shape_smoke);

		part_type_color1(eff_type,make_color_rgb(128, 128, 128));
		part_type_size(eff_type,0.02,0.02,0,0);

		part_type_speed(eff_type,0.02,0.2,0,0);

		part_type_direction(eff_type,0,259,0,0);

		part_type_life(eff_type,30,60);
		part_type_alpha2(eff_type, 1,0);

		part_emitter_region(eff_system,emitter,x,x,y,y,ps_shape_line,ps_distr_gaussian);
		part_emitter_burst(eff_system,emitter,eff_type,30);
}
}else {	
	instance_destroy();
	}














