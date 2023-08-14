/// @description DRAW_GUI_UI
// Você pode escrever seu código neste editor

draw_text_ext_transformed(0,0,global.player_coin,10,300,3,3,0);

draw_text_ext_transformed(0,100,global.armor,10,300,3,3,0);
draw_text_ext_transformed(0,200,global.shield,10,300,3,3,0);
draw_text_ext_transformed(0,300,global.heat,10,300,3,3,0);
draw_text_ext_transformed(0,400,global.attack,10,300,3,3,0);

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
//Player Ships sprits
var _ship01 = spr_USS_Cerulean;
var _ship02 = spr_USS_Emberstrike;
var _ship03 = spr_USS_Verdant_Shield
var _ship_pai =O_ship_parent;

//room coords 
var rm_w = room_width/4;
var rm_h = room_height/3;


#endregion
#region  game UI REGION
if room == rm_game_1_1 or room == rm_game_1_2 {
    // HUI elements


    // Draw Heat Capacity
    draw_sprite_ext(spr_GunHeat, 0, 50, 260, _scale, _scale, 0, c, 1);
    var currentHeat, maxHeat;
    if instance_exists(O_ship_parent) {
         maxHeat = O_ship_parent.maxHeat;
         currentHeat = O_ship_parent.heat;
        var max_shield = O_ship_parent.max_shield;
        var current_shield = O_ship_parent.shield;

        draw_sprite_ext(spr_GunHeatBar, 0, 50, 260, _scale, (currentHeat / maxHeat) * _scale, 0, c, 1);
        draw_sprite_ext(spr_HUI_lifebar, 1, 150, 80, _scale, (current_shield / max_shield) * _scale, 0, c, 1);
    }

	// Draw Item Slots
	var itemPositions = [80, 140, 200];
	for (var i = 0; i < array_length(itemPositions); i++)
	{
	    draw_sprite_ext(spr_HUI_rectangle, 0, itemPositions[i], 140, _scale / 1.8, _scale / 1.8, 0, c, 1);
	}

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
	for (var i = 0; i < _ship_pai.life_ship ; i++) {
	    draw_sprite_ext(Spr_hUI_heart, 0, pos_x, 25, _scale, _scale, 0, c, 1);
		pos_x += 35;
	}
		//SHIELD BARS 
	var max_shield = O_ship_parent.max_shield;
	var current_shield = O_ship_parent.shield;
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


#region // Player selection screen
if pick_ship and room == rm_game_1_1 or pick_ship and room == rm_game_1_2
{
// Define a cor de fundo do retângulo que preenche toda a tela da sala
draw_rectangle_color(0, 0, room_width, room_height, C, p, cA, C, false); //back color

// Desenha a área da barra de rolagem usando um sprite
draw_sprite_ext(Spr_scrllbar_area, 0, 7, 571, 3.1, 1.7, image_angle, image_blend, image_alpha);

// Definindo as informações dos elementos a serem exibidos
var _scroll_data = [
    [Spr_config_panel, 26, 608, 1.6, 0.7], // [sprite, x, y, scaleX, scaleY]
    [scifi_inventory02_box_select01, 126, 639, 5, 5],
    [Spr_diamont, 294, 639, 0.7, 0.7],
    [spr_coin, 294, 702, 0.2, 0.2],
    [spr_buttonlock, 512, 640, 0.2, 0.2]
];

// Define a posição vertical do limite superior do Spr_config_panel
var config_panel_limit = 400;

// Define a posição vertical do limite inferior
var limit_bottom = 571 + sprite_get_height(Spr_scrllbar_area) * 1.7;

// Define o número de conjuntos a serem exibidos 
//var number_of_ships = 8;

// Define o deslocamento vertical inicial
var _y_offset = 0;

// Loop através dos conjuntos
for (var _nDisplay = 0; _nDisplay < number_of_ships; _nDisplay++) {
    var draw_set = true;
    
    // Loop através dos elementos do conjunto
    for (var _scl = 0; _scl < array_length(_scroll_data); _scl++) {
        var _scrolldata_info = _scroll_data[_scl];
        var _scroll_y = scrollpos + (_y_offset + _scrolldata_info[2]);
        
        // Verifique se o elemento está dentro dos limites verticais
        if (_scroll_y + sprite_get_height(_scrolldata_info[0]) > config_panel_limit && _scroll_y < limit_bottom) {
            if (_scrolldata_info[0] == Spr_config_panel) {
                // Verifique se o Spr_config_panel toca o limite superior
                if (_scroll_y <= config_panel_limit) {
                    draw_set = false;
                    break;
                }
            }
        } else {
            // Se um elemento não está dentro dos limites, defina o draw_set como falso
            draw_set = false;
            break;
        }
    }
    
    // Se o conjunto deve ser desenhado, desenhe todos os elementos
    if (draw_set) {
        for (var _scl = 0; _scl < array_length(_scroll_data); _scl++) {
            var _scrolldata_info = _scroll_data[_scl];
            var _scrollsprite = _scrolldata_info[0];
            var _scroll_x = _scrolldata_info[1];
            var _scroll_y = scrollpos + (_y_offset + _scrolldata_info[2]);
            var _scroll_xscale = _scrolldata_info[3];
            var _scroll_yscale = _scrolldata_info[4];
            
            // Desenha o sprite com as informações fornecidas
            draw_sprite_ext(_scrollsprite, 0, _scroll_x, _scroll_y, _scroll_xscale, _scroll_yscale, image_angle, c_white, 1);
        }
    }
    
    // Ajusta o deslocamento vertical para o próximo conjunto
    _y_offset += 200;
}

	draw_rectangle_color(0, 0, room_width, 571, C, p, cA, C, false); //back color
draw_text(mouse_x + 50,mouse_y, scrollpos);
#region Background  layer
	var _back_ground = [
	[Spr_config_panel,               32,  160, 1.6, 1.6],      // first panel 
	[Spr_config_panel,               303, 254, 0.8, 0.8],     //second panel 
	[scifi_inventory02_box_select01, 111, 254, 8,   8  ],    // shipBOX

	[Spr_hUI_heart,                  334, 272, 6.9, 6.9],  // heart
	[Spr_HUI_shield,                 334, 333, 6.9, 6.9], // shield
	[Spr_speed,                      338, 387, 0.5, 0.5],//speed

	];
	
	for (var _bg = 0; _bg <array_length(_back_ground); _bg++) 
	{	
	var _sprite_info = _back_ground[_bg];
    var _sprite = _sprite_info[0];
    var _x = _sprite_info[1];
    var _y = _sprite_info[2];
    var _xscale = _sprite_info[3];
    var _yscale = _sprite_info[4];
	
	    draw_sprite_ext(_sprite,0,_x,_y,_xscale,_yscale,image_angle,c_white,1);
		
	}
	#endregion
	#region Upside buttons 
	var _upsidebutton_data = [
	[Spr_home,             608, 96,   0.3, 0.3],
	[Spr_shop,             32,  96,   0.2, 0.2],
	[Spr_tab02,            97,  190,  0.7, 0.7],
	[Spr_tab02,            207, 190,  0.7, 0.7],
	[Spr_backbutton,       104, 448,  1,   1  ],
	[spr_nextbutton,       280, 448,  1,   1  ],
	[Spr_select,           190, 448,  1,   1  ],
	//[vertical_hover_thumb, 681, 595,  1,   1  ],
	//[horizontal_idle_thumb,677, 598,  1.5, 1.5]
	];
	
	for (var _up = 0; _up <array_length(_upsidebutton_data ); _up++) 
	{	
	var _data_info = _upsidebutton_data[_up];
    var _sprite = _data_info[0];
    var _x = _data_info[1];
    var _y = _data_info[2];
    var _xscale = _data_info[3];
    var _yscale = _data_info[4];
	
	    draw_sprite_ext(_sprite,0,_x,_y,_xscale,_yscale,image_angle,image_blend,image_alpha);
	}
	
	var _settings_button_data = [];

	// Data of coords buttons
	for (var _Bup = 0; _Bup < array_length(_upsidebutton_data); _Bup++) {
	    var _btn_info = _upsidebutton_data[_Bup];
	    var _btn_x = _btn_info[1];
	    var _btn_y = _btn_info[2];
	    var _btn_width = sprite_get_width(_btn_info[0]) * _btn_info[3];
	    var _btn_height = sprite_get_height(_btn_info[0]) * _btn_info[4];

	    _settings_button_data[_Bup] = [_btn_x, _btn_y, _btn_x + _btn_width, _btn_y + _btn_height];
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
        switch (_clicked_button)
		{ 
			case 0: room_goto(rm_Mapa); break;
			case 1: show_message("shop"); break;
			case 2: show_message("info ship"); break;
			case 3: show_message("historia ship"); break;
			case 4: show_message("back_ship"); break;
			case 5: show_message("next_ship"); break;
			case 6: show_message("select_ship") break;
			//case 7: show_message("scroll bar") break;
			//case 8: show_message("scrol point") break;
		}
	}
	}
	

	#endregion 
	// Upbox buttons 
	
/*
	//window character creation
	//background
    var _background_l = sprite_get_width(spr_back_menu) * 24;
    var _background_A = sprite_get_height(spr_back_menu) * 24;
    var _guiback_L = rm_w - _background_l / 8;
    var _guiback_A = rm_h - _background_A / 8;

    var _display_x = rm_w + (_background_l / 2) - (_scale * sprite_get_width(spr_display_ship)) / 2;
    var _display_y = rm_h + (_background_A / 2) - (_scale * sprite_get_height(spr_display_ship)) / 2;
	
	var porttrait_posX = _display_x + 50;
	var porttrait_posY = _display_y + 50;
	

    
    draw_sprite_ext(spr_back_menu, 0, rm_w, rm_h, 24, 24, 0, c, 1); //background rectangle
    draw_sprite_ext(spr_display_ship, 0, _display_x, _display_y, _scale, _scale, 0, c, 1); // rectangle

if (choose_ship) // player is choosing their ships
{
    // Mapeamento dos sprites das naves
    var ship_sprites = [
        spr_USS_Cerulean,
        spr_USS_Emberstrike,
        spr_USS_Verdant_Shield,
        spr_USS_Shadowstrike,
        Spr_USS_Thundercore
    ];

    // Verifica se o número da nave selecionada é válido
    var selected_ship = clamp(trakying_ship - 1, 0, array_length(ship_sprites) - 1);

    // Desenha o sprite da nave selecionada
    draw_sprite_ext(ship_sprites[selected_ship], 0, porttrait_posX, porttrait_posY, _scale, _scale, targetAngle, c, 1);
}
else
{
    // Sprite base dos personagens
    var character_base_sprite = spr_HUI_character;

    // Número total de frames dos personagens
    var num_character_frames = 9; // Aumentar a cada sprite de personagem nova 

    // Verifica se o número do personagem selecionado é válido
    var selected_character_frame = clamp(Pyframe_icon, 0, num_character_frames - 1);

    // Desenha o sprite do personagem selecionado com base no frame
    draw_sprite_ext(character_base_sprite, selected_character_frame, porttrait_posX, porttrait_posY, _scalahalf, _scalahalf, 0, c, 1);
}



// Desenha os botões de navegação para o jogador percorrer as opções de nave/personagem.
// Os botões são representados pelo sprite "Spr_next".
// A variável "posnext2" representa a posição horizontal inicial do primeiro botão.
// A variável "subimg" representa o número da subimagem do sprite a ser desenhada (1 ou 0).
    var posnext2 = 300;
    var subimg = 1;
    repeat (2)
    {
        draw_sprite_ext(Spr_next, subimg, posnext2, _display_y + 130, _scale, _scale, 0, c, 1);
        posnext2 += 150;
        subimg -= 1;
    }

    // Verifica se o mouse está sobre o botão de navegação esquerdo ou direito.
    var previous_button = point_in_rectangle(_mx, _my, 300, 700, 340, 740);
    var next_button = point_in_rectangle(_mx, _my, 450, 600, 480, 680);
draw_rectangle(300, 700, 340, 740,true)
    // Se o botão esquerdo ou direito do mouse foi pressionado...
    if mouse_check_button_pressed(mb_left)
    {
        // Verifica se o jogador está escolhendo a nave (choose_ship é verdadeira) e qual botão foi pressionado.
        if choose_ship
        {
            if previous_button
                trakying_ship = clamp(trakying_ship - 1, 1, max_trakying_ship);
            else if next_button
                trakying_ship = clamp(trakying_ship + 1, 1, max_trakying_ship);
        }
        else // Caso esteja escolhendo um personagem.
        {
            if previous_button
                Pyframe_icon = clamp(Pyframe_icon - 1, 1, max_Pyframe_icon);
            else if next_button
                Pyframe_icon = clamp(Pyframe_icon + 1, 1, max_Pyframe_icon);
        }
    }
	
// Desenha o botão de confirmação para o jogador escolher sua opção.
// O jogador pode confirmar sua escolha de nave ou personagem ao clicar nesse botão.
// Calcula a posição do botão de confirmação
var button_x = 358;
var button_y = 750;
var button_size = _scalahalf * sprite_get_width(spr_button_play);

// Desenha o botão de confirmação
draw_sprite_ext(spr_button_play, 0, button_x, button_y, _scalahalf, _scalahalf, 0, c, 1);

// Verifica se o mouse está sobre o botão de confirmação e o botão esquerdo do mouse foi pressionado
if point_in_rectangle(_mx, _my, button_x - button_size/2, button_y - button_size/2, button_x + button_size/2, button_y + button_size/2) && mouse_check_button_pressed(mb_left)
{
    // Define o valor de choose_ship diretamente usando o operador ternário.
    choose_ship = choose_ship ? false : true;

    // Se não estiver escolhendo a nave, cria a instância do jogador com base no valor de "trakying_ship"
    if (choose_ship)
    {
		O_timer.alarm[0] = 6;
		choose_ship = false;
        pick_ship = false; // Saindo do menu de seleção
        instance_create_layer(rm_w, 1070, "instances", ship_dict[trakying_ship]);

    }
}
*/
}

#endregion

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
			case 5: show_message("low graphics"); break;

			// activate mid grafics
            case 6: show_message("mid graphics"); break;
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
/*
// Variável para armazenar o número de instâncias do objeto OaideShip
var Contador = 0;

// No evento Step ou Draw
Contador = instance_number(ObigMeteor);
draw_text(x, y, "Quantidade de OaideShip: " + string(Contador));
draw_text_ext_transformed(0,0,fps_real,1,2,3,3,0);
draw_text_ext_transformed(0,100,fps,1,2,3,3,0);
*/
#endregion


#endregion

// go to pos fase 
if pos_fase 
{

draw_set_alpha(0.6);

// Evento de desenho
// Define as coordenadas do retângulo a ser desenhado centralizado na tela
var rect_x = (room_width - 450) / 2;
var rect_y = (room_height - 450) / 2;

// Desenha um retângulo colorido na tela usando a cor "C"
draw_rectangle_color(rect_x, rect_y, rect_x + 450, rect_y + 450, C, C, C, C, false);

// Define as coordenadas e o tamanho do botão
var button_x = 330;
var button_y = 780;
var button_size = _scalahalf * sprite_get_width(spr_button_play);
var button_x_next = button_x + 42;
var button_y_next = button_y - 38;

// Desenha o sprite do botão na tela com as coordenadas e escala definidas
draw_sprite_ext(spr_button_play, 0, button_x, button_y, _scalahalf, _scalahalf, 0, c_white, 1);

// Desenha um retângulo invisível na tela que servirá como área clicável do botão
draw_rectangle(button_x_next - button_size/2, button_y_next - button_size/2, button_x_next + button_size/2, button_y_next + button_size/2, false);

// Desativa a camada "control_layer" no jogo // para o player não atirar nem andar
instance_deactivate_layer("control_layer");

// Verifica se o mouse está sobre a área do botão e se o botão esquerdo do mouse foi pressionado
if point_in_rectangle(_mx, _my, button_x_next - button_size/2, button_y_next - button_size/2, button_x_next + button_size/2, button_y_next + button_size/2) && mouse_check_button_pressed(mb_left)
{
    // o jogo vai para a sala "rm_Hightspeed", e a variável "pos_fase" é definida como false.
    room_goto(rm_Hightspeed);
    pos_fase = false;

    draw_set_alpha(1);
}


}
