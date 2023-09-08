// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_normal_player_moviment()
	{
    var _move_x = 0;
    var _move_y = 0;

    with(Ojoystick) {	
        _move_x = joy_x / radius;
        _move_y = joy_y / radius;
		
    }
    // Predict the next position based on the joystick input
    var next_x = x + _move_x * move_speed;
    var next_y = y + _move_y * move_speed;

    // Use the scr_locking_room function to prevent the player from leaving the room
    var corrected_positions = scr_locking_room(next_x, next_y);
    next_x = corrected_positions[0];
    next_y = corrected_positions[1];

    // Update player position based on joystick input
    x = next_x;
    y = next_y;

    if (_move_x != 0 or _move_y != 0) {
        direction = point_direction(0, 0, -Ojoystick.joy_x, -Ojoystick.joy_y);
        image_angle = direction;

		if !instance_exists(Oparticles_eff)
		{
			instance_create_depth(x,y,100, Oparticles_eff);
		}
	
    }	

}