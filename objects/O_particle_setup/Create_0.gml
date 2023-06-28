/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
particleSytem = part_system_create_layer("Effect_1",0);

particleTypehit = part_type_create();
part_type_sprite( particleTypehit, spr_particle_sprite,0,0,0);
part_type_size( particleTypehit, 3,6, 3,1);
part_type_life( particleTypehit, 5,15);
part_type_alpha3( particleTypehit, 1, 0.6,0.2);
part_type_orientation( particleTypehit, 0, 359,0,0,0);

particleTypespark = part_type_create();
part_type_sprite( particleTypespark, spr_particle_sprite,0,0,0);
part_type_size( particleTypespark, 6,8, -0.01,0);
part_type_life( particleTypespark, 25,30);
part_type_alpha3( particleTypespark, 1, 0.8,0.1);
part_type_orientation( particleTypespark, 0, 359,0,0,0);
part_type_speed( particleTypespark, 2.4, -0.1, 0, 0);
part_type_direction( particleTypespark, 0, 359,0,0);
part_type_color3( particleTypespark, 45823, 828418, 952788);