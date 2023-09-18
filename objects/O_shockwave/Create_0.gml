/// @description Inserir descrição aqui
// Você pode escrever seu código neste editox
image_xscale = 10;
image_yscale =10;

bullets_particle_system = part_system_create_layer("Instances",0);

particle_trail = part_type_create();

part_type_sprite(particle_trail,sprite_index, 0,0,0);
part_type_life(particle_trail,35,35);
part_type_alpha3(particle_trail,1,0.3,0);
part_type_size(particle_trail,3,4,0,1);
part_type_blend(particle_trail,1);
alarm_set_min = 3;
alarm_set_max = 5;
alarm[0]= 400;
alarm[1] = 5;













