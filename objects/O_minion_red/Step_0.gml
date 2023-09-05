/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Calculate the player's position
var _player_x = instance_exists(O_player_parent) ? O_player_parent.x : x;
var _player_y = instance_exists(O_player_parent) ? O_player_parent.y : y;


// Calculate the gravitational center position
var grav_center_x, grav_center_y;
if (instance_exists(Osatellite) && lock_onOrbit) {
    grav_center_x = Osatellite.x;
    grav_center_y = Osatellite.y;
} else if (lock_onOrbit) {
    grav_center_x = undefined;
    grav_center_y = undefined;
} else {
    grav_center_x = _player_x;
    grav_center_y = _player_y;
}

// Calculate the new position and direction
if (grav_center_x != undefined && grav_center_y != undefined) {
    speed = 0;
    orbit_dir += orbit_speed;

    // Calculate the new position of "enemy" using trigonometry
    var angle_rad = degtorad(orbit_dir);
    x = grav_center_x + orbit_distance * cos(angle_rad);
    y = grav_center_y + orbit_distance * sin(angle_rad);

    // Update the direction based on the new center of gravity (grav_center_x, grav_center_y)
    direction = point_direction(x, y, grav_center_x, grav_center_y);
    image_angle = direction;
} else {
    // Limit the movement within orbit_distance
    var distance_to_player = point_distance(x, y, _player_x, _player_y);
    if (distance_to_player > orbit_distance) {
        image_angle = direction;
        move_towards_point(_player_x, _player_y, 2);
    } else {
        // Update the gravitational center if the ship is within orbit_distance of the player
        lock_onOrbit = false;
        direction = point_direction(x, y, _player_x, _player_y);
    }
}



// Set the alarm to shoot
if (alarm[1] == -1) {
    alarm[1] = 120;
}

if (minion_attk) 
{
	
	if (alarm[0] == -1)
	{
	var _inst =instance_create_layer(x,y,"enemy_layer",O_minion_bullet);
		_inst.speed = 6;
		_inst.direction = direction;
		alarm[0] = 30;
		audio_play_sound(snd_bullet01,1,false);
		
	}
}	
 	





