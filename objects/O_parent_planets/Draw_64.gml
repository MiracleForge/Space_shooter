/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
/// Definição de cores

// Color definitions
var C = c_white; 
var c = c_black; 
var cA = c_aqua; 



if (global.open_gui && planet_id == id)
{
    var _alpha = 0.8; // Define the opacity (transparency) of the panel
    draw_set_alpha(_alpha); // Temporarily disable transparency for this code section (lines 12-14)
    draw_rectangle_color(0, 0, room_width, room_height, c, c, c, c, false); // Draw a filled black rectangle (background)

	var _sprites = [spr_window_frame, spr_menu_organizer, spr_planet_panel, spr_text_box, sprite_index, spr_button_menu_panel, spr_button_menu_panel, spr_button_menu_panel, spr_button_menu_panel, spr_button_menu_panel, spr_button_menu_panel];
	// Posições horizontais dos sprites
	var _x_positions = [1, 86, 0, 364.98, 546, 86, 86, 86, 86, 86, 32];
	// Posições verticais dos sprites
	var _y_positions = [0.5, 172.49, 124.5, 640.49, 491, 560, 460, 355, 671, 780, 1024];
	// Escalas horizontais dos sprites
	var _xscales = [0.5679, 1, 1, 0.3356, 5, 0.8840, 0.8840, 0.8840, 0.8840, 0.8840, 2.2753];
	// Escalas verticais dos sprites
	var _yscales = [1.5541, 0.9962, 1, 1.47, 5.6666, 0.3640, 0.3640, 0.3640, 0.3640, 0.3640, 1.1825];


    // Draw sprites and texts for each button
    var _mission_description = [
        ["ice", "ice mission", "Ice mission 2", "ice mission 3"],
        ["Water", "Mission water 1", "Mission water 2", "Mission water 3"],
        ["Earth_like", "Mission earth", "Mission earth 2", "Mission earth 3"],
        ["lava", "Mission lava", "Mission lava 2", "Mission 3 lava"],
        ["Calisto", "Mission calisto", "Mission 2 calisto", "Mission 3 calisto"],
    ];

    var _planet_description = [
        ["ice", "ice description"],
        ["Water", "water description"],
        ["Earth_like", "earth description"],
        ["lava", "lava description"],
        ["Calisto", "calisto description"],
    ];

	var room_for_missions = [
	    [rm_Hightspeed,rm_Hightspeed, rm_Hightspeed],  // Planet 1 rooms for mission 1, 2, 3
	    [rm_Hightspeed, rm_Hightspeed, rm_Hightspeed],  // Planet 2 rooms for mission 1, 2, 3
	    [rm_game_1_1, rm_game_1_2, rm_Hightspeed],  // Planet 3 rooms for mission 1, 2, 3
	    [rm_Hightspeed, rm_Hightspeed, rm_Hightspeed],  // Planet 3 rooms for mission 1, 2, 3
	    [rm_Hightspeed, rm_Hightspeed, rm_Hightspeed],  // Planet 3 rooms for mission 1, 2, 3
	    // Add more entries for other planets if needed
	]
    var _button_names = ["Mission 2", "Mission 1", "Play", "Mission 3", "Exit"]; // wrong order because I messed up with coord of buttons array

    for (var i = 0; i < array_length(_sprites); i++) {
         textIndex = i; // Set "textIndex" initially to "i", meaning the current index of the loop (0, 1, 2, ...).
        switch (sprite_index[i]) { // changes the icon exibeted and the info 
            case Ice: textIndex = 0; break;
            case Terran: textIndex = 1; break;
            case Earth: textIndex = 2; break;
            case Lava: textIndex = 3; break;
            case Baren: textIndex = 4; break;
        }
		
        var descriptionIndex = mission3 ? 3 : (mission2 ? 2 : 1); // verify mission3 is true? else if mission 2 , else mission1 = true
        draw_sprite_ext(_sprites[i], image_index, _x_positions[i], _y_positions[i], _xscales[i], _yscales[i], 0, C, 1); // Draw the sprite in the correct position
		draw_set_font(Fnt_Menu_description);
		//draw the missions of planets
        draw_text_ext_color(408, 670, _mission_description[textIndex][descriptionIndex], string_height("M"), 300, c_white, c_white, c_white, c_white, 1); // Draw the description text
        //draw the descriptions of planets
		draw_text_ext_color(100, 1050, _planet_description[textIndex][1], string_height("M"), 300, C, C, C, C, 1);
    }
	draw_set_font(Fnt_Menu);
    var _button_name_x = _x_positions[5] + 40; // Initial horizontal position to draw button names

    for (var i = 0; i < 5; i++) {
        var _button_name_y = _y_positions[5 + i] + 20;
        draw_text_ext_color(_button_name_x, _button_name_y, _button_names[i], string_height("M"), 300, cA, cA, cA, cA, 1);
    }

  // Check if the left mouse button was pressed
if (mouse_check_button_pressed(mb_left)) {
 

    // Button data - contains information about each button's name and coordinates
    var btn_data = [
        ["play", 95, 210, 315, 270],      // [button_name, left_x, top_y, right_x, bottom_y]
        ["mission1", 95, 338, 315, 390],  // Each entry represents a different button
        ["mission2", 95, 440, 315, 510],
        ["mission3", 95, 580, 315, 640],
        ["exit", 95, 720, 315, 760]
    ];

    var clicked_button = -1; // Initialize clicked_button to -1 (no button clicked)

    // Loop through the button data to find which button was clicked
    for (var i = 0; i < array_length(btn_data); i++) {
        var btn = btn_data[i];
        // Check if the mouse cursor is within the rectangle of the current button
        if (point_in_rectangle(mouse_x, mouse_y, btn[1], btn[2], btn[3], btn[4])) {
            clicked_button = i; // Record the index of the clicked button
            break; // Exit the loop, no need to check further
        }
    }

    // If a button was clicked
    if (clicked_button >= 0) {
        show_message(btn_data[clicked_button][0]); // Show a message with the name of the clicked button

        // Array of actions corresponding to each button
        var actions = [
            [mission1,mission2,mission3], // play button - [mission1, mission2, mission3]
            [true, false, false],  // mission1 button - [mission1, mission2, mission3]
            [false, true, false],  // mission2 button - [mission1, mission2, mission3]
            [false, false, true],  // mission3 button - [mission1, mission2, mission3]
            [false, false, false]  // exit button - [mission1, mission2, mission3]
        ];

        // Apply the corresponding action to the clicked button
        mission1 = actions[clicked_button][0]; // Set mission1 variable based on the clicked button
        mission2 = actions[clicked_button][1]; // Set mission2 variable based on the clicked button
        mission3 = actions[clicked_button][2]; // Set mission3 variable based on the clicked button
	 
		if (clicked_button == 0 && textIndex >= 0 && textIndex < array_length(_mission_description)) {
		    if (mission1) {
		        show_message("play " + _mission_description[textIndex][1] + " 1");
		        room_goto(room_for_missions[textIndex][0]); // Go to the appropriate room for mission 1
		    } else if (mission2) {
		        show_message("play " + _mission_description[textIndex][1] + " 2");
		        room_goto(room_for_missions[textIndex][1]); // Go to the appropriate room for mission 2
		    } else if (mission3) {
		        show_message("play " + _mission_description[textIndex][1] + " 3");
		        room_goto(room_for_missions[textIndex][2]); // Go to the appropriate room for mission 3
		    }
		}

        global.open_gui = clicked_button != 4; // Set open_gui variable based on the clicked button (true for all buttons except "exit")
        planet_select = clicked_button != 4;   // Set planet_select variable based on the clicked button (true for all buttons except "exit")

        audio_play_sound(snd_button, 0, false); // Play a button click sound
    }
}

    //draw_set_alpha(-1); // Restore the default transparency (lines 54-56)
}



