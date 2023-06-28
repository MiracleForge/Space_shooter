/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_text(x,y, alarm[0])
var _ship = O_ship_parent;
var _sniper = O_enemy_sniper;
if instance_exists(_ship) and instance_exists(_sniper){

x = _sniper.x - 20;
y = _sniper.y +80;

direction = point_direction(_sniper.x, _sniper.y,_ship.x, _ship.y);
var max_lenght = distance_to_object(_ship);
for (i = 0; i < max_lenght; i++) {
    xEnd = x + lengthdir_x(i, direction);
    yEnd = y + lengthdir_y(i, direction);
    
    lenght_lazer = i;
    if collision_point(xEnd, yEnd , O_ship_parent, 1, 0) {
        part_particles_create(O_particle_setup.particleSytem, xEnd, yEnd, O_particle_setup.particleTypehit, 1);
        part_particles_create(O_particle_setup.particleSytem, xEnd, yEnd, O_particle_setup.particleTypespark, 10);
       
        break;
    }
}

if instance_exists(O_enemy_parent){	
	var _list = ds_list_create();
	var _hits = collision_line_list(x,y,xEnd, yEnd, O_enemy_parent, 0,0, _list,0)
	
	if _hits > 0 {
		for (var k = 0; k < _hits; ++k ) {
		    _list [| k].life = _list[| k].life = -5
		}
		ds_list_destroy(_list);
	}
	}

if !instance_exists(_sniper) or alarm[0] == -1
{
	instance_destroy(O_enemy_lazer);	
}
}