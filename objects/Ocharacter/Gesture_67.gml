/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Set the initial state of mouse dragging to true
var _mouse_dragging = true;
// Store the initial vertical position of the mouse cursor
var _drag_start_y = mouse_y;
// store the superior limite of scroll area  (number from panel area)
var scroll_area_down = 571;
// store the superior limite of scroll area  (number from panel area)
var scroll_area_up = 20;
// Calculate the maximum scroll position based on whether pilots or ships are being shown
var _max_scrollpos = is_showing_pilots ? ((number_of_pilots - 3) * -200) : ((number_of_ships - 3) * -200);
// veloc or size area scroll down or up at time; 
var _scroll_veloc = 5;

// Check if the mouse is being pressed and update the previous mouse Y position
if (mouse_y > scroll_area_up and mouse_check_button_pressed(mb_left)) {
    mouse_yprevious = mouse_y;
}

// Check if the mouse is being dragged and not confirming a buy action
if (mouse_y > scroll_area_down and mouse_check_button(mb_left) and !confirm_buy)  {
    // Calculate the change in Y position of the mouse
    var mouse_y_change = mouse_y - mouse_yprevious;
    
    // Check if the mouse is being dragged downwards and the scroll position is within bounds
    if (mouse_y_change > 0 and scrollpos <= scroll_area_up) {
        // Scroll content downwards
        scrollpos += _scroll_veloc;
    }
    // Check if the mouse is being dragged upwards and the scroll position is within bounds
    else if (mouse_y_change < 0 and scrollpos >= _max_scrollpos) {
        // Scroll content upwards
        scrollpos -= _scroll_veloc;
    }
    
    // Update the previous mouse Y position for the next iteration
    mouse_yprevious = mouse_y;
}













