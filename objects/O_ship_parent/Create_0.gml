/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
//ship size default

image_xscale = 2;
image_yscale = 2;

currentState = scr_normal_state;

// ship config default
ammo = 2;
move_speed = 2 + global.speedo;
max_movespeed = 2;
heat = 0;
maxHeat = 140 + global.heat;
max_life = 10 + global.armor;
life_ship = max_life;
active = true;

shield = 10;
max_shield = 10 + global.shield;
overheat = false;

//hit damage
damage_alpha = -1;
take_damage = true;
shield_up = true;
// shot controls default

shoot_on = false;
dial_control = false;
enum Py_speed
{
	height_speed_pos,
	height_speed_moving,
	height_speed_dialog,
	height_speed_end
}
current_attk = undefined;
current_overheat = undefined;
current_special = undefined;
room_Py_speed = Py_speed.height_speed_pos;
normal_attk = current_attk;
overheat_attk = current_overheat;
special_attk = current_special;
instance_create_layer(x,y,"layer_under", Oshield);
if current_ship == 1{	

	instance_create_layer(x,y,"layer_under", Oengine);

	
	}else if current_ship == 2{
	instance_create_layer(x,y,"layer_under", Oengine);
	instance_create_layer(x,y,"layer_under", Oengine);
	}

