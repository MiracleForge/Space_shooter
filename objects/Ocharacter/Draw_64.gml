/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var _mx = device_mouse_x(0);
var _my = device_mouse_y(0);
// gui size

//collours
var c = c_white;
var C = c_black;
var cA = c_aqua;
var p = c_purple;

if Ogame.pick_ship and room == rm_game_1_1 or Ogame.pick_ship and room == rm_game_1_2
{
/* Disclamer : Aparte superior da selação de nave e personagem está mais a baixo, pois precisei
				desenhar um funto colorida para esconder os conjuntos que subiam com o scroll. 
*/

// Define a cor de fundo do retângulo que preenche toda a tela da sala
draw_rectangle_color(0, 0, room_width, room_height, C, p, cA, C, false); //back color
#region 
// Desenha a área da barra de rolagem usando um sprite
draw_sprite_ext(Spr_scrllbar_area, 0, 7, 571, 3.1, 1.7, image_angle, image_blend, image_alpha);

// Definindo as informações dos elementos a serem exibidos nos conjuntos do scroll
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

// Define o deslocamento vertical inicial
	var _y_offset = 0;

	var _size_switch = is_showing_pilots ? number_of_pilots : number_of_ships;
	var _blockSwitch = is_showing_pilots ? pilots.Block : status.Block;
	var _gridSwitch =is_showing_pilots ? allpilots : allships;
	var _moneySwitch = is_showing_pilots ? pilots.Money : status.Money;
	var _diamondsSwitch = is_showing_pilots ? pilots.Diamonds : status.Diamonds;
	var _scaleSwitch = is_showing_pilots ? 9 :3
	
for (var _nDisplay = 0; _nDisplay < _size_switch; _nDisplay++) {
	
    var draw_set = true;
    var _blockStatus =  ds_grid_get(_gridSwitch, _nDisplay, _blockSwitch);
	
    
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
			
            if (_scl == 4)
			{
                switch (_blockStatus) {
                    case 0: _scrollsprite = spr_unlocked; break;
                    case 1: _scrollsprite = spr_buttonlock;
	
					 if (mouse_check_button_pressed(mb_left) && point_in_rectangle(mouse_x, mouse_y, _scroll_x, _scroll_y, _scroll_x + sprite_get_width(_scrollsprite) * _scroll_xscale, _scroll_y + sprite_get_height(_scrollsprite) * _scroll_yscale))
					 {	
						 if !confirm_buy
							{    //conj_clicked = _nDisplay;
								 number_of__ndisplay = _nDisplay
								 confirm_buy = true;
								 
							}
					 }
                        break;
                }
			
            }
			
            // Desenha o sprite com as informações fornecidas
            draw_sprite_ext(_scrollsprite, 0, _scroll_x, _scroll_y, _scroll_xscale, _scroll_yscale, image_angle, c_white, 1);
	
        } 
        
        // Desenha a nave correspondente ao índice da interação
        var _shipIndex = is_showing_pilots ? spr_HUI_character : ds_grid_get(allships, _nDisplay, status.sprite);
        var _moneyIndex = ds_grid_get(_gridSwitch, _nDisplay, _moneySwitch);
        var _diamondIndex = ds_grid_get(_gridSwitch, _nDisplay, _diamondsSwitch);
        var _pilots = is_showing_pilots ? _nDisplay : 0;
		
        draw_sprite_ext(_shipIndex, _pilots, 181, _scroll_y + 55, _scaleSwitch, _scaleSwitch, 0, c, 1);
        draw_text_ext_color(352, _scroll_y + 70, _moneyIndex, 5, 300, cA, cA, cA, cA, 1);
        draw_text_ext_color(352, _scroll_y + 10, _diamondIndex, 5, 300, cA, cA, cA, cA, 1);
    }
// elements of confirm window of buy system
if (confirm_buy)
{
	    var _confirm = [
	        [Spr_config_panel, 160, 800, 1, 1],
	        [Spr_close, 486, 841, 0.6, 0.6],
	        [Spr_tab02, 192, 928, 1, 1],
	        [Spr_tab02, 384, 928, 1, 1],
	        [spr_coin, 253, 941, 0.2, 0.2],
	        [Spr_diamont, 443, 941, 0.7, 0.7]
	    ];
    
    
	    var moneycost = ds_grid_get(_gridSwitch, number_of__ndisplay, _moneySwitch);
	    var diamondcost = ds_grid_get(_gridSwitch, number_of__ndisplay, _diamondsSwitch);
    
	    var denied_money_text = ["Are you sure About that", "You don't have enough money", "You don't have enough diamonds"];
    
	    var clickedItem = -1;
    
	    for (var _conf = 0; _conf < array_length(_confirm); _conf++)
	    {
	        var _confData = _confirm[_conf];
	        var _confsprite = _confData[0];
	        var _confX = _confData[1];
	        var _confY = _confData[2];
	        var _conf_xscale = _confData[3];
	        var _conf_yscale = _confData[4];
        
	        draw_sprite_ext(_confsprite, 0, _confX, _confY, _conf_xscale, _conf_yscale, image_angle, image_blend, image_alpha);
        
	        var _confWidth = sprite_get_width(_confsprite) * _conf_xscale;
	        var _confHeight = sprite_get_height(_confsprite) * _conf_yscale;
        
	        if (point_in_rectangle(mouse_x, mouse_y, _confX, _confY, _confX + _confWidth, _confY + _confHeight))
	        {
	            clickedItem = _conf;
	        }
	    }
    
	    if (mouse_check_button_pressed(mb_left))
	    {
	        if (clickedItem == 1) // Check if Close button was clicked
	        {
	            confirm_buy = false;
	            purchase_denied = 0;
	        }
	        else if (clickedItem >= 4 && clickedItem <= 5) // Check if Money or Diamonds button was clicked
	        {
	            var moneyOrDiamond = (clickedItem == 4) ? "money" : "diamonds";
	            var affordability = (moneyOrDiamond == "money") ? global.player_coin : global.player_diamond;
	            var itemCost = (moneyOrDiamond == "money") ? moneycost : diamondcost;
            
	            if (affordability >= itemCost)
	            {
	                _gridSwitch[# number_of__ndisplay, _blockSwitch] = false;
                
	                if (moneyOrDiamond == "money")
	                {
	                    global.player_coin -= itemCost;
	                }
	                else if (moneyOrDiamond == "diamonds")
	                {
	                    global.player_diamond -= itemCost;
	                }
                
	                show_message("Buyed " + moneyOrDiamond);
	                confirm_buy = false;
	                purchase_denied = 0;
	            }
	            else
	            {
	                purchase_denied = (moneyOrDiamond == "money") ? 1 : 2;
	            }
	        }
	    }
    
	    if (purchase_denied >= 0 && purchase_denied < array_length(denied_money_text))
	    {
	        draw_text_ext_color(192, 864, denied_money_text[purchase_denied], string_height("M"), 300, cA, cA, cA, cA, 1);
	    }
	}
    // Ajusta o deslocamento vertical para o próximo conjunto
    _y_offset += 200;
}



#endregion
#region // parte superior , seleção de nave e jogador
draw_rectangle_color(0, 0, room_width, 571, C, p, cA, C, false); //back color

#region Background  layer
var _blockStatus = ds_grid_get(_gridSwitch, trakying_ship, _blockSwitch);

var _back_ground = [
    [Spr_config_panel,               32,  160, 1.6, 1.6],      // first panel 
    [Spr_config_panel,               303, 254, 0.8, 0.8],     // second panel 
    [scifi_inventory02_box_select01, 111, 254, 8,   8  ],    // shipBOX
    [Spr_hUI_heart,                  334, 272, 6.9, 6.9],  // heart
    [Spr_HUI_shield,                 334, 333, 6.9, 6.9], // shield
    [Spr_speed,                      338, 387, 0.5, 0.5], // speed
];


for (var _bg = 0; _bg < array_length(_back_ground); _bg++) 
{
    var _sprite_info = _back_ground[_bg];
    var _sprite = _sprite_info[0];
    var _x = _sprite_info[1];
    var _y = _sprite_info[2];
    var _xscale = _sprite_info[3];
    var _yscale = _sprite_info[4];

    if (is_show_ship_status and !is_showing_pilots || _bg <= 2) 
    {
        draw_sprite_ext(_sprite, 0, _x, _y, _xscale, _yscale, image_angle, c_white, 1);
    }
}

 // draw ships status if  they are unblocked
if (!_blockStatus) {
    // Descriptions of different ship types
    var shipInfo = [
        "A common fighter of the United Space Forces.\nWith high-speed engines and focus on kinetic projectiles.",
        "Adeptly excels in delivering calculated missile devastation, despite its moderate speed, ensuring tactical precision.",
        "An emerald powership, boasts robust hull, powerful weaponry, and deliberate fire rate for tactical superiority.",
        "A stealthy bomber, possesses remarkable bombardment power for high-impact strikes.",
        "The Thundercore, an eccentric vessel, wields weaponry to neutralize enemy shields and unleash long-range projectiles."
    ];
	
	var pilotInfo = [
		" Pilot 0 is a formidable pilot",
		" Pilot 1 is a formidable pilot",
		" Pilot 2 is a formidable pilot",
		" Pilot 3 is a formidable pilot",
		" Pilot 4 is a formidable pilot",
		" Pilot 5 is a formidable pilot",
		" Pilot 6 is a formidable pilot",
		" Pilot 7 is a formidable pilot"
	];
    // Extract ship data from the grid
    var _spriteIndex = is_showing_pilots ? spr_HUI_character : allships[# trakying_ship, status.sprite];
    var _heartIndex = allships[# trakying_ship, status.Heart];
    var _shieldIndex = allships[# trakying_ship, status.Shield];
    var _speedIndex = allships[# trakying_ship, status.Speed];
	// extract info from the array
	var desc_info = is_showing_pilots ? pilotInfo : shipInfo

// Define a universal scale factor for all sprites
var universalScale = is_showing_pilots ? 16 : ((sprite_get_width(_spriteIndex) > 16) ? 5 : 6);
var _angleSwitch = is_showing_pilots ? 0 : targetAngle
var _pilotSwitch = is_showing_pilots ? trakying_ship : 0;
// Draw the ship's sprite with the calculated scale
draw_sprite_ext(_spriteIndex, _pilotSwitch, 200, 340, universalScale, universalScale, _angleSwitch, c_white, 1);

    // Set font and display ship status if enabled
    draw_set_font(Fnt_Menu_description);
    if (is_show_ship_status)
	{
		if is_showing_pilots
		{
			var _pilotdescriptions = ds_grid_get(allpilots, trakying_ship, pilots.Description);
			draw_text_ext_color(320, 290, _pilotdescriptions, string_height("M"), 290, cA, cA, cA, cA, 1);
		}else
			{
		        var textValues =  [_heartIndex, _shieldIndex, _speedIndex];
		        var textY = 276;
		        var textSpacing = 57;

		        // Display ship status values
		        for (var i = 0; i < array_length(textValues); i++) {
		            draw_text_ext_color(383, textY + textSpacing * i, textValues[i], 1, 300, cA, cA, cA, cA, 1);
			}
        }
    } else {
        // Display ship description
        draw_set_halign(fa_left);
        draw_text_ext_color(320, 290, desc_info[trakying_ship], string_height("M"), 290, cA, cA, cA, cA, 1);
        draw_set_halign(-1);
    }
}


#endregion

#region Upside buttons 
// Definição dos dados dos botões na seguinte ordem:
// [Sprite, Posição X, Posição Y, Escala X, Escala Y]
var _upsidebutton_data = [
    [Spr_home, 608, 96, 0.3, 0.3],
    [Spr_shop, 32, 96, 0.2, 0.2],
    [Spr_tab02, 97, 190, 0.7, 0.7],
    [Spr_tab02, 207, 190, 0.7, 0.7],
    [Spr_backbutton, 104, 448, 1, 1],
    [spr_nextbutton, 280, 448, 1, 1],
    [Spr_select, 190, 448, 1, 1]
];

// Loop através dos dados dos botões
for (var _up = 0; _up < array_length(_upsidebutton_data); _up++) 
{
    // Extrai as informações do botão atual
    var _data_info = _upsidebutton_data[_up];
    var _sprite = _data_info[0];
    var _x = _data_info[1];
    var _y = _data_info[2];
    var _xscale = _data_info[3];
    var _yscale = _data_info[4];
    
    // Desenha o sprite do botão com as informações fornecidas
    draw_sprite_ext(_sprite, 0, _x, _y, _xscale, _yscale, image_angle, image_blend, image_alpha);
    
    // Determina o texto a ser exibido no botão com base no índice _up
    var buttonText = "";
    
    switch (_up) {
        case 2:
            buttonText = "Ship";
            break;
        case 3:
            buttonText = "Details";
            break;
    }
    
    // Calcula as coordenadas X e Y para centralizar o texto no botão
    var spriteWidth = sprite_get_width(_sprite);
    var spriteHeight = sprite_get_height(_sprite);
    var textWidth = string_width(buttonText);
    var textHeight = string_height(buttonText);
    var textX = _x + (spriteWidth * _xscale - textWidth) / 2;
    var textY = _y + (spriteHeight * _yscale - textHeight) / 2;

	var _pilots_names = ["Capitan0", "Capitan1", "Capitan2", "Capitan3","Capitan4","Capitan5","Capitan6","Capitan7",]
    // Desenha o texto no botão com a posição calculada
    draw_text_ext_color(textX, textY, buttonText, 1, 300, cA, cA, cA, cA, 1);
	var _spriteIndex = is_showing_pilots ? spr_HUI_character : ds_grid_get(allships, trakying_ship, status.sprite);
	var _spriteName = sprite_get_name(_spriteIndex);
	// Remove the "spr_" prefix
	_spriteName = is_showing_pilots ? _pilots_names[trakying_ship] : string_delete(_spriteName, 1, 4);
			
	draw_text_ext_color(400, 448, _spriteName,5,300,cA,cA,cA,cA,1);
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
			case 2: show_message("info ship"); is_show_ship_status = true; break;
			case 3: show_message("historia ship");is_show_ship_status = false; break;
			case 4: show_message("back_ship");
    
		    // Start searching for the previous unlocked ship from the current position
			    for (var prev_ship = trakying_ship - 1; prev_ship >= 0; prev_ship--) {
			        var blocked = ds_grid_get(_gridSwitch, prev_ship, _blockSwitch);
        
			        if (blocked == 0) {
			            trakying_ship = prev_ship;
			            break; // Found the previous unlocked ship, exit the loop
			        }
			    }
    
			    // If no unlocked ship is found, wrap around to the end
			    if (prev_ship < 0) {
			        for (var prev_ship = _size_switch - 1; prev_ship > trakying_ship; prev_ship--) {
			            var blocked = ds_grid_get(_gridSwitch, prev_ship, _blockSwitch);
            
			            if (blocked == 0) {
			                trakying_ship = prev_ship;
			                break; // Found the previous unlocked ship, exit the loop
			            }
			        }
			    }
		    break;
			case 5:
				show_message("next_ship");
				for (var next_ship = trakying_ship + 1; next_ship < _size_switch; next_ship++) {
				    var blocked = ds_grid_get(_gridSwitch, next_ship, _blockSwitch);
    
				    if (blocked == 0) {
				        trakying_ship = next_ship;
				        break; // Found the next unlocked ship, exit the loop
				    }
				}

				// Handle wrapping around if no unlocked ship is found ahead
				if (next_ship >= _size_switch) {
				    for (var next_ship = 0; next_ship < trakying_ship; next_ship++) {
				        var blocked = ds_grid_get(_gridSwitch, next_ship, _blockSwitch);
        
				        if (blocked == 0) {
				            trakying_ship = next_ship;
				            break; // Found the next unlocked ship, exit the loop
				        }
				    }
				}
			
			break;
			case 6: show_message("select_ship") // use the sprite name to create the objeto choose by player
					if is_showing_pilots 
					{
						is_showing_pilots = false;
						is_show_ship_status = true;
						Ogame.Pyframe_icon = trakying_ship;
						trakying_ship = 0;
						scrollpos = 0;
						
						}else
			            {
						 var _spriteIndex = ds_grid_get(allships, trakying_ship, status.sprite);
						// Get the sprite name from the sprite index
						var _spriteName = sprite_get_name(_spriteIndex);
						// Remove the "spr_" prefix
						_spriteName = string_delete(_spriteName, 1, 4);
						// Prefix the sprite name with "O_"
						var _instanceSpriteName = "O_" + _spriteName;
						show_message(_instanceSpriteName);
						// Get the object index based on the instanceSpriteName
						var _instanceObjIndex = asset_get_index(_instanceSpriteName);
						// Create the ship instance using the object index
						var shipInstance = instance_create_layer(room_width/2, room_height/2 , "instances", _instanceObjIndex);
						Ogame.pick_ship = false;
						instance_destroy();
						}	
			break;

		}
	}

	}
	draw_set_font(-1);

#endregion
#endregion 
}












