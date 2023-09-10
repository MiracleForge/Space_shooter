/// @description DRAW_GUI_UI
// Você pode escrever seu código neste editor
if instance_exists(O_timer)
{
draw_text(0,0,O_timer.alarm[0])
}
#region //Variables from UI
// Mouse tracking
var _mx = device_mouse_x(0);
var _my = device_mouse_y(0);
// gui size
var _guiL = display_get_gui_width();
var _guia = display_get_gui_height();
var _scale =  6;
var _scalahalf = _scale *1.5;
//collours
var c = c_white;
var C = c_black;
var cA = c_aqua;
var p = c_purple;
var _ship_pai =O_player_parent;

//room coords 
var rm_w = room_width/4;
var rm_h = room_height/3;


#endregion
#region  game UI REGION
if  !is_showing_posphase and!pick_ship and room == rm_game_1_1 or pick_ship and room == rm_game_1_2 
{
    // HUI elements


    // Draw Heat Capacity
    draw_sprite_ext(spr_GunHeat, 0, 50, 260, _scale, _scale, 0, c, 1);
    var currentHeat, maxHeat;
    if instance_exists(_ship_pai) {
         maxHeat = _ship_pai.maxHeat;
         currentHeat = _ship_pai.heat;
        var max_shield = _ship_pai.max_shield;
        var current_shield = _ship_pai.shield;

        draw_sprite_ext(spr_GunHeatBar, 0, 50, 260, _scale, (currentHeat / maxHeat) * _scale, 0, c, 1);
        draw_sprite_ext(spr_HUI_lifebar, 1, 150, 80, _scale, (current_shield / max_shield) * _scale, 0, c, 1);
    }

#region// special attack area
var _spc_offsety = 0;
var _btn_scale = _scale / 1.5;
if instance_exists(O_player_parent) 
{
    for (var spl = 0; spl < 3; spl++) 
    {
        var power_sprite_index = ds_list_find_value(O_player_parent.powers_list, spl);
        var btn_x = 95;
        var btn_y = 947 + _spc_offsety;
        var btn_width = _btn_scale;
        var btn_height = _btn_scale;
        
        draw_sprite_ext(spr_HUI_special, 0, 68, btn_y, _btn_scale, _btn_scale, 0, c, 1);
        if (power_sprite_index != -1) 
        {
            draw_sprite_ext(power_sprite_index, 0, btn_x , btn_y + 27, _btn_scale, _btn_scale, image_angle, image_blend, image_alpha);
            
            // Verifique se o mouse está dentro da área do botão e o botão esquerdo foi pressionado
		if !special_slot1 and !special_slot2 and !special_slot3 and !O_player_parent.special_active 
		{
			 if (point_in_rectangle(_mx, _my, 70, 947 + _spc_offsety, 130, 995 + _spc_offsety ) && mouse_check_button_pressed(mb_left))
            {
			
	                switch(spl)
					{
						case 0:
							special_slot1 = true;
						break;
						case 1 : 
							special_slot2 = true;
						break;
						case 2 : 
							special_slot3 = true;
						break;
					}
				}
				//show_message("Botão " + string(spl + 1) + " clicado!");
                // Coloque aqui a ação que deseja executar quando o botão é clicado
            }else {
				power_sprite_index = -1;
			}
           
        }
		
        _spc_offsety += 75;
    }
}
draw_text(mouse_x, mouse_y, special_slot1);
draw_text(mouse_x, mouse_y - 40, special_slot2);
draw_text(mouse_x, mouse_y - 80, special_slot3);
#endregion

	// Draw Player Portrait
	draw_sprite_ext(spr_HUI_character, Pyframe_icon, 74, 74, _scale * 1.7, _scale * 1.7, 0, c, 1);
	draw_sprite_ext(spr_HUI_porttrait, 0, 15, 15, _scale * 1.2, _scale * 1.2, 0, c, 1);

#region Life bars and Shield bars //timers

draw_sprite_ext(spr_HUI_lifebar, 0, 150, 80, _scale, _scale, 0, c, 1);
//score
    draw_text_transformed_colour(200, 186, score, 2, 2, 0,cA, cA, cA, cA, 1);
    draw_text_transformed_colour(90, 185, "Score", 2, 2, 0,cA, cA, cA, cA, 1);
	
	if (object_exists(O_timer) and global.pause == false)
	{
		var t = ""
		    t += string(O_timer.t_min)
			t += ":"
		if O_timer.t_sec > 9 
		{
			t +=  ""+string(O_timer.t_sec);	
		}
		if O_timer.t_sec < 10 
		{
			 t += "0"+string(O_timer.t_sec);
		}
			t += "."
			t += string(O_timer.t_mil);
			
			draw_set_color(cA);
			if O_timer.t_min < 1 then draw_set_color(c_red);
			draw_text_transformed(90, 220, t, 2, 2, 0);
			draw_set_color(-1);
	}

if instance_exists(_ship_pai){
	var pos_x = 160;
	for (var i = 0; i < _ship_pai.current_life ; i++) {
	    draw_sprite_ext(Spr_hUI_heart, 0, pos_x, 25, _scale, _scale, 0, c, 1);
		pos_x += 35;
	}
		//SHIELD BARS 
	var max_shield = _ship_pai.max_shield;
	var current_shield = _ship_pai.shield;
	var barHeight = (currentHeat / maxHeat) * _scale ;
	var barShield = (current_shield / max_shield) * _scale

	draw_sprite_ext(spr_HUI_lifebar, 1, 150, 80, barShield,_scale , 0, c, 1);
	var pos_x = 150;
	draw_sprite_ext(spr_HUI_lifebar, 0, 150, 80, lenght_shieldBar/2, _scale, 0, c, 1);
	for (var i = 0; i < _ship_pai.shield; i++) {
	    draw_sprite_ext(spr_HUI_lifebar, 2, pos_x, 80, _scale,_scale , 0, c, 1);
		pos_x += 10;
		lenght_shieldBar = i;
	}

  }
 
}
#endregion

#endregion ////END UI

#region // PAUSE GAME //////////////////////////////////////////////////
if global.pause == true
{
if !surface_exists(paused_surf)
    {
    if paused_surf == -1
        {
        instance_deactivate_all(true); // DESACTIVATE ALL INSTANCES
		// REACTIVA ONLY THE BUTTONS
		instance_activate_object(Omusic_control);
		instance_activate_object(Opausebutton);
		instance_activate_object(O_ui_parent);
		instance_activate_object(O_multi_touch_manager);
		
        }
    paused_surf = surface_create(room_width, room_height);
    surface_set_target(paused_surf);
    draw_surface(application_surface, 0, 0);
    surface_reset_target();
	
    }
else {	
 // Draw the paused surface
draw_surface(paused_surf, 0, 0);

// Apply a semi-transparent overlay
draw_set_alpha(0.5);
draw_rectangle_colour(0, 0, room_width, room_height, C, C, C, C, false);
draw_set_alpha(1);

// Horizontal alignment setup for text
draw_set_halign(fa_left);

// Combined array of sprite data

var _sprite_data = [
    [spr_window_frame,     0,    0,    0.5609, 1.8625],
    [spr_coin,             32,   1056, 0.3,    0.3],
    [spr_text_box,         127,  880,  0.4570, 0.84],
    [Spr_home,             608,  96,   0.3,    0.3],
    [Spr_audio_control,    504,  96,   0.4,    0.4],
    [Spr_shop,             32,   96,   0.23,   0.23],
	[Spr_skill_tree,       46,   223,  1.3,    1.5],
    [spr_button_menu_panel,267,  447,  0.884,  0.364],
    [spr_button_menu_panel,267,  511,  0.884,  0.364],
    [spr_button_menu_panel,267,  575,  0.884,  0.364],
	
];

// Names of buttons
var _pause_button_names = ["Resume", "Settings", "Exit"];

// Loop through sprite data
for (var _i = 0; _i < array_length(_sprite_data); ++_i) {
    var _sprite_info = _sprite_data[_i];
    var _sprite = _sprite_info[0];
    var _x = _sprite_info[1];
    var _y = _sprite_info[2];
    var _xscale = _sprite_info[3];
    var _yscale = _sprite_info[4];
    var _offset_x = 8;
    var icon_pox_x = _x - 50;
	var _mute_icon = isoundOn ? 0: 1; // if same sprite gets more frames, this will not work anymore, 
	if settings and _i == 6 {break;}
    // Draw the sprite at specified position with scaling
    draw_sprite_ext(_sprite, _mute_icon, _x, _y, _xscale, _yscale, 0, c, image_alpha);
    if (_i == 1)
	{         // PLAYER CURRENT STATUS ON PAUSE MENU
	    draw_text_transformed_colour(_x + 50, _y, score, 2, 2, 0,cA, cA, cA, cA, 1);
	}
    // Check if index is greater than or equal to the index for buttons
    if (_i >= array_length(_sprite_data) - array_length(_pause_button_names)) {
        var _button_index = _i - (array_length(_sprite_data) - array_length(_pause_button_names));
        var _button_name = _pause_button_names[_button_index];
        
        // Calculate the center position for text
        var _sprite_center_x = _x + (sprite_get_width(_sprite) * _xscale) / 2.8;
        var _sprite_center_y = _y + (sprite_get_height(_sprite) * _yscale) / 2.5 - 5;
        
        // Set the font and draw the button text
        draw_set_font(Fnt_Menu);
        draw_text_ext_color(_sprite_center_x - _offset_x, _sprite_center_y, _button_name, string_height("M"), 300, cA, cA, cA, cA, 1);
		draw_sprite_ext( spr_icon_pause,  _button_index , icon_pox_x,_y,1.6,1.6,image_angle,c,image_alpha);
		
        // Update offset and reset it position  after every EXIT button
        _offset_x += 16;
        if (_button_index % 2 == 1) {
            _offset_x = 0;
        }
    }
}


// Check if the left mouse button was pressed
if mouse_check_button_pressed(mb_left) and !settings {
    // List of button names to be displayed
    var _button_names = ["Home Button", "Audio Control", "Shop", "Skill three", "Resume", "Settings", "Exit"];
    var _button_data = []; // Initialize an array to store button data
    var _index_of_buttons = 3; //only for buttons that have a text on it 
    
    // Loop through the button names to create button data
    for (var _i = 0; _i < array_length(_button_names); _i++) {
        var _button_name = _button_names[_i];
        var _left_x = _sprite_data[_i + _index_of_buttons][1];
        var _top_y = _sprite_data[_i + _index_of_buttons][2];
        var _right_x = _left_x + (sprite_get_width(_sprite_data[_i + _index_of_buttons][0]) * _sprite_data[_i + _index_of_buttons][3]);
        var _bottom_y = _top_y + (sprite_get_height(_sprite_data[_i + _index_of_buttons][0]) * _sprite_data[_i + _index_of_buttons][4]);
        
        // Store button data in the array
        _button_data[_i] = [_button_name, _left_x, _top_y, _right_x, _bottom_y];
    }
    
    // Find which button was clicked
    var _clicked_button = -1; // Initialize clicked_button to -1 (no button clicked)
    
    // Loop through the button data to find which button was clicked
    for (var _i = 0; _i < array_length(_button_data); _i++) {
        var _btn = _button_data[_i];
        // Check if the mouse cursor is within the rectangle of the current button
        if (point_in_rectangle(mouse_x, mouse_y, _btn[1], _btn[2], _btn[3], _btn[4])) {
            _clicked_button = _i; // Record the index of the clicked button
            break; // Exit the loop, no need to check further
        }
    }

    // If a button was clicked
    if (_clicked_button >= 0) {
        // Debug
        show_message(_button_data[_clicked_button][0] + " clicked"); // Mostra uma mensagem com o nome do botão clicado
    
        switch (_clicked_button) {
			// change to phase selection
            case 0:  global.pause = false; audio_stop_all(); room_goto(rm_Mapa);break;
            // button mute
            case 1: 
				isoundOn = !isoundOn; 
				var _audio_action = isoundOn ? audio_resume_all : audio_pause_all;
                audio_master_gain(isoundOn ? 1 : 0); // Define o volume mestre para 1 (som ativado) ou 0 (som desativado)
                show_message(isoundOn ? "som on" : "som off");
                _audio_action();
                break;
			// shop
			case 2: show_message("shop?") break;
			// skill tree
            case 3: global.pause = false; room_goto(rm_skillTree); break;
            // resume game
			case 4: global.pause = false; break; 
			// open settings config
			case 5: settings = true; break;
			// close pause and exit to menu
            case 6: scr_reestart_game();game_restart(); break;
        }
        
        audio_play_sound(snd_button, 0, false); // Toca um som de clique de botão
    }

} 
	// settings draw 
	//settings data base
if settings 
	{
	
	var _settings_data = [
	[Spr_config_panel, 64,  479, 1.5,  1.5],
	[Spr_audio_control,140, 567, 0.5,  0.5],
	[Spr_iconconfig,   160, 704, 0.18, 0.18],
	[horizontal_hover_thumb, 264, 593, 0.4, 1],
	[Spr_close,        608, 544, 0.5,  0.5],
	[Spr_tab03,        260, 716, 2,   3],
	[Spr_tab02,        352, 716, 0.6,  0.6],
	[Spr_tab01,        448, 716, 2,    3],	
	];

for (var _s = 0; _s < array_length(_settings_data); _s++) {
    var _settings_info = _settings_data[_s];
    var _sprite = _settings_info[0];
    var _x = _settings_info[1];
    var _y = _settings_info[2];
    var _xscale = _settings_info[3];
    var _yscale = _settings_info[4];
    
    draw_sprite_ext(_sprite, 0, _x, _y, _xscale, _yscale, image_angle, c, 1);

}
	draw_sprite_ext(Spr_point_volume,0,posx_volume,600,0.2,0.2,image_angle,c, image_alpha);
// Initialize settings button data array
var _settings_button_data = [];

// Loop through the settings data starting from the fifth element
for (var _i = 3; _i < array_length(_settings_data); _i++) {
    var _btn_info = _settings_data[_i];
    var _btn_x = _btn_info[1];
    var _btn_y = _btn_info[2];
    var _btn_width = sprite_get_width(_btn_info[0]) * _btn_info[3];
    var _btn_height = sprite_get_height(_btn_info[0]) * _btn_info[4];

    _settings_button_data[_i - 3] = [_btn_x, _btn_y, _btn_x + _btn_width, _btn_y + _btn_height];
}

// Check for button click
if (mouse_check_button_pressed(mb_left)) {
    var _clicked_button = -1; // Initialize clicked_button to -1 (no button clicked)

    // Loop through the button data to find which button was clicked
    for (var _i = 0; _i < array_length(_settings_button_data); _i++) {
        var _btn = _settings_button_data[_i];
        if (point_in_rectangle(mouse_x, mouse_y, _btn[0], _btn[1], _btn[2], _btn[3])) {
            _clicked_button = _i;
            break;
        }
    }

    if (_clicked_button != -1) {
        // Do something with the clicked button
        switch (_clicked_button + 3) { // Adding 4 to get the correct button index
			case 3: 
			
	            var newVolume = (mouse_x - _settings_button_data[_clicked_button][0]) / (_settings_button_data[_clicked_button][2] - _settings_button_data[_clicked_button][0]);
                var adjustedVolume = clamp(newVolume, 0, 1); // Ensure volume is within range
				// Update posx_volume to be proportional to the adjustedVolume and within the bounds of the bar
                posx_volume = _settings_button_data[_clicked_button][0] + (_settings_button_data[_clicked_button][2] - _settings_button_data[_clicked_button][0]) * adjustedVolume;
                audio_master_gain(adjustedVolume);	
			 break;
			// close settings window
            case 4: settings = false; break;
		    // Tab 01 desactivate all grafics
			case 5: light_mode_light = false; break;

			// activate mid grafics
            case 6: light_mode_light = true; break;
            // Tab 02
            case 7: show_message("height graphics"); break;
			
            
        }
	

        audio_play_sound(snd_button, 0, false);
    }

}

}

}
draw_set_font(-1);
}
#endregion

#region //debuging area

#region // contador de instancias

//// Variável para armazenar o número de instâncias do objeto OaideShip
//var Contador = 0;

// No evento Step ou Draw
//Contador = instance_number(Oparticles_eff);
//draw_text(x, y, "Quantidade de OaideShip: " + string(Contador));
//draw_text_ext_transformed(0,0,fps_real,1,2,3,3,0);
//draw_text_ext_transformed(0,100,fps,1,2,3,3,0);

#endregion


#endregion

