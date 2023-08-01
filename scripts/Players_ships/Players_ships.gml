// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_normal_state()
{
	#region ship moviment
var _move_x = 0;
var _move_y = 0;

with(Ojoystick){	
	_move_x = joy_x/ radius;
	_move_y = joy_y/ radius;
	}
x += _move_x * move_speed;
y += _move_y * move_speed;

if _move_x != 0 or _move_y != 0{
direction = point_direction(0, 0, -Ojoystick.joy_x, -Ojoystick.joy_y);
image_angle = direction;

}

if keyboard_check(vk_up){	
	speed = -2;
	
    image_angle = direction;

	}else if keyboard_check(vk_down) {	
	speed = +2;
	}else {	
		speed = 0;
		}
	
if keyboard_check(vk_left){	
	direction += 3;
	}
if keyboard_check(vk_right){	
	direction -=3;
	}
move_wrap(true,false,0)
#endregion	

if room == rm_Hightspeed
{	
	currentState = scr_player_height_speed;
}
}


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
            if (!instance_exists(Oalert_room) and !dial_control)
            {
                dial_control = true;
                instance_create_depth(x, y, -200, Oalert_room); // Create the alert room instance
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
            

            
            var distance_to_target = point_distance(x, y, x, -50);

            // If the player is very close to the target position (-50)
            if (distance_to_target < 20)
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
				vspeed = 0;
				currentState = scr_normal_state;
				}
			}
            break;
    }
}



