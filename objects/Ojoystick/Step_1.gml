/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Check if there is an active touch (touch_id is not equal to -1)
if (touch_id != -1)
{
    // Check if the left mouse button is pressed for the specific touch (touch_id)
    if (device_mouse_check_button(touch_id, mb_left))
    {
        // Calculate the horizontal (joy_x) and vertical (joy_y)
		//distance of the touch from the object's position (x, y) on the GUI (graphical user interface)
        joy_x = device_mouse_x_to_gui(touch_id) - x;
        joy_y = device_mouse_y_to_gui(touch_id) - y;

        // Calculate the direction angle (in degrees)
		//and distance from the object's position to the touch point
        var _direction = point_direction(0, 0, joy_x, joy_y);
        var _distance = point_distance(0, 0, joy_x, joy_y);

        // If the distance between the touch point and the object's position 
		//is greater than the radius, limit the distance to the radius
        if (_distance > radius)
        {
            // Calculate the new joy_x and joy_y values using the lengthdir_x and lengthdir_y functions
            joy_x = lengthdir_x(radius, _direction);
            joy_y = lengthdir_y(radius, _direction);
        }
    }
    else
    {
        // If the left mouse button is not pressed for the specific touch,
		//reset the touch_id to -1 and set joy_x and joy_y to 0.
        touch_id = -1;
        joy_x = 0;
        joy_y = 0;
    }
}

