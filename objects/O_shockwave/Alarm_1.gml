/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var _amount = irandom_range(1,4);
repeat (_amount)
{
var _lenght = 10;
var _angle_diff = choose(-15,-15);
var _xDiff =  x + lengthdir_x(_lenght, direction + 90 + _angle_diff);
var _yDiff =  y + lengthdir_y(_lenght, direction + 90 + _angle_diff);
part_particles_create(bullets_particle_system,x,y,particle_trail,1);
part_type_orientation(particle_trail, direction + 45, direction + 45,0,0,0);
}
var _randomloop = irandom_range(alarm_set_min,alarm_set_max);
alarm_set(1,_randomloop);














