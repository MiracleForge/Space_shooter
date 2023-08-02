/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var C = c_white;
var c = c_black;
var cA = c_aqua;
if (open_gui == true)
{
	

    var _alpha = 0.8;
   draw_set_alpha(_alpha);

  draw_rectangle_color(0, 0, room_width, room_height, c,c,c,c, false);
                  
					
    var _sprites = [spr_window_frame, spr_menu_organizer, spr_planet_panel, spr_text_box,sprite_index,spr_button_menu_panel,spr_button_menu_panel,spr_button_menu_panel];
    var _x_positions = [1, 86, 0, 364.98,546,86,86,86.001];
    var _y_positions = [0.5, 172.49, 124.5, 640.49,491,560,460,355];
    var _xscales = [0.5679, 1, 1, 0.3356,5,0.8840,0.8840,0.8840];
    var _yscales = [1.5541, 0.9962, 1, 1.47,5.6666,0.3640,0.3640,0.3640];

    var _sprite_count = array_length(_sprites);
    for (var i = 0; i < _sprite_count; i++) {
        draw_sprite_ext(_sprites[i], image_index, _x_positions[i], _y_positions[i], _xscales[i], _yscales[i], 0,C, 1);
		
    }
	


/// Check button click and handle actions
var btn_exit = create_button_data(5, 95, 440, 315, 510);
var btn_mission = create_button_data(6, 95, 338, 315, 390);
var btn_planet = create_button_data(7, 95, 210, 315, 270);


if (mouse_check_button_pressed(mb_left)) {
    if (point_in_button(mouse_x, mouse_y, btn_exit)) {
        open_gui = false;
        show_message("exit!");
    } else if (point_in_button(mouse_x, mouse_y, btn_mission)) {
        
        show_message("mission");
    } else if (point_in_button(mouse_x, mouse_y, btn_planet)) {
      
        show_message("planet");
    }
	
}
	//draw_text_ext_color(408, 670, "That planet are made of pure water from e-girls", string_height("M"), 3, C, C, C, C, 1);
    
 draw_text(408, 670, "That planet are made of pure water from e-girls");	
 // draw_set_alpha(-1);
}









