/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
//ship size default
image_xscale = 2;
image_yscale = 2;
// ship config default
ammo = 2;
move_speed = 2;
heat = 0;
maxHeat = 140;
life_ship = 4;
shield = 10;
max_shield = 10;
overheat = false;

//hit damage
damage_alpha = -1;
take_damage = true;
shield_up = true;
// shot controls default
shoot_on = false;
instance_create_layer(x,y,"layer_under", Oshield);
if current_ship == 1{	

	instance_create_layer(x,y,"layer_under", Oengine);

	
	}else if current_ship == 2{
	instance_create_layer(x,y,"layer_under", Oengine);
	instance_create_layer(x,y,"layer_under", Oengine);
	}
