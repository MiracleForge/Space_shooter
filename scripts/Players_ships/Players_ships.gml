// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_normal_state()
{
    #region ship movement

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
    }

    if keyboard_check(vk_up) {	
        speed = -2 + global.speedo;
        image_angle = direction;
    } else if keyboard_check(vk_down) {	
        speed = +2;
    } else {	
        speed = 0;
    }
    
    if keyboard_check(vk_left) {	
        direction += 3;
    }
    if keyboard_check(vk_right) {	
        direction -= 3;
    }

    //move_wrap(true, false, 0);
    #endregion	
	
	
    if room == rm_Hightspeed {
        currentState = scr_player_height_speed;
    }
}

#region // controls bords 

function scr_locking_room(next_x, next_y)
{
    var borderY_inf = (room_height - 200); // Set the desired bottom boundary here

    // Calculate the leftmost and rightmost points of the sprite
    var leftmost_x = next_x - sprite_width / 2;
    var rightmost_x = next_x + sprite_width / 2;

    // Calculate the topmost and bottommost points of the sprite
    var topmost_y = next_y - sprite_height / 2;
    var bottommost_y = next_y + sprite_height / 2;

    // Check if any part of the sprite is outside the room boundaries
    if (leftmost_x < 0) {
        next_x = sprite_width / 2; // Prevent horizontal movement if left side outside room
    } else if (rightmost_x > room_width) {
        next_x = room_width - sprite_width / 2; // Prevent horizontal movement if right side outside room
    }

    if (topmost_y < 0) {
        next_y = sprite_height / 2; // Prevent vertical movement if top side outside room
    } else if (bottommost_y > borderY_inf) {
        next_y = borderY_inf - sprite_height / 2; // Prevent vertical movement if bottom side outside room
    }

    // Return the corrected positions as an array
    return [next_x, next_y];
}
#endregion


// Function to control player movement and behavior based on room_Py_speed

function scr_player_height_speed()
{
    // Define target coordinates and offset
    var target_x = 340;
    var target_y = 1290;
    var pos_offset = 800;

    // Check the current state defined by room_Py_speed
    switch(room_Py_speed)
    {
        case Py_speed.height_speed_pos:
            // Move the player to target_x and target_y position
            x = target_x;
            y = target_y;

            // Check if the player has reached the target position
            if (x == target_x and y == target_y)
            {
                // If reached, change the state to height_speed_moving
                room_Py_speed = Py_speed.height_speed_moving;
            }
            break;

        case Py_speed.height_speed_moving:
            // Set image_angle and direction to make the player face upwards
            image_angle = 270;
            direction = 270;

            // Move the player upward using lerp until pos_offset
            y = lerp(y, pos_offset, 0.01);

            // Check the distance to the target
            var distance_to_target = point_distance(x, y, x, pos_offset);

            // If the player is very close to the target position
            if (distance_to_target < 2.0) // Adjust the precision as needed
            {
                // Set the player's position to pos_offset
                y = pos_offset;

                // Change the state to height_speed_dialog
                room_Py_speed = Py_speed.height_speed_dialog;
            }
            break;

        case Py_speed.height_speed_dialog:
            // Check if the alert room instance doesn't exist and dial_control is false
			
           // if (!instance_exists(Oalert_room) and !dial_control)
           // {
               // dial_control = true;
               // instance_create_depth(x, y, -200, Oalert_room); // Create the alert room instance
           // }
				if !instance_exists(Ospeak) 
				{
					var _inst =instance_create_depth(0,0,-9999,Ospeak);
					dial_control = true;
					_inst.text_id = "first travel";	

				}
            // Check if the global.dialog_down is true
            if (global.dialog_down)
            {
                // If true, change the state to height_speed_end
                room_Py_speed = Py_speed.height_speed_end;

                // Play the engine sound
                audio_play_sound(snd_engine_on, 2, false);
            }
            break;

        case Py_speed.height_speed_end:
           
                vspeed --; // Adjust the vertical speed as needed
            

            
            var _distance_to_point = point_distance(x, y, x, -50);

            // If the player is very close to the target position (-50)
            if (_distance_to_point < 20)
            {
                // Set the audio_is_playing flag to true and check the audio for the new sound
                global.audio_is_playing = true;
                scr_check_audio_playing(snd_leving_hieght_speed);

                // If the new sound is not playing, play it and set the flag to true
                if (global.audio_is_playing == false)
                {
                    audio_play_sound(snd_leving_hieght_speed, 2, false);
                    global.audio_is_playing = true;
                }
				
            }
			var ship_width = sprite_get_width(sprite_index); // Largura do sprite da nave
			var ship_height = sprite_get_height(sprite_index); // Altura do sprite da nave

			if (y < 0 || y > room_height - ship_height)
			{
				x = 20 
				y = 200
				if room != rm_Mapa
				{
			    room_goto(rm_Mapa);
				//vspeed = 0;
				//currentState = scr_normal_state;
				//dial_control = false;
				instance_deactivate_object(O_ship_parent);
				with(O_ship_parent)
				{
						vspeed = 0;
						currentState = scr_normal_state;
						dial_control = false;
						visible = false;
				}
				global.audio_is_playing = false;
				global.dialog_down = false;
				audio_stop_all();
				}
			}
            break;
    }
}



