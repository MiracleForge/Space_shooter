/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


    if (take_damage == true) {
        alarm[2] = 200;   
        take_damage = false;
        life_ship -= 1;
		move_speed -= 1;
		instance_create_layer(x,y,"instances",O_eff_energy_field);
    }