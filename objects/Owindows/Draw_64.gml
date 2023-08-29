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
		" The pilot from the colonies of Nova Prime, often considered a USS promise, still has much to learn.",
		" An officer from the USS Academy, his explosive temper and lack of discipline blend well with his ship EmberStrike.",
		" The leader of the USS. He led humans to triumph over the Vigalnitas.",
		" The first Vigalnita pilot in the USS, representing his race after the end of the human-Vigalnita war.",
		" Skilled green-skinned mercenary with tentacle-tipped eyes, emerged from the galactic underworld.",
		" Skilled pilot with a single emerald eye, explored the cosmos, uncovering hidden truths own his path of discovery",
		" A secretive mercenary known for never removing their helmet, navigates the galaxy with unmatched skill.",
		" Crafted by Dr. Zara Epsilon, features intricate design, advanced algorithms, and incomprehensible beeps."
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
    [Spr_backbutton, 84, 440, 1, 1],
    [spr_nextbutton, 260, 440, 1, 1],
    [Spr_select, 170, 440, 1, 1]
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

	var _pilots_names = [
	"Ethan Nova",
	"Liam Garrison",
	"Colonel Marcus Blackwood", 
	"Kael Drakar",
	"Zara Thorne",
	"Kaelan Verdanteye",
	"Ironshade",
	"R3X-4",]
    // Desenha o texto no botão com a posição calculada
    draw_text_ext_color(textX, textY, buttonText, 1, 300, cA, cA, cA, cA, 1);
	var _spriteIndex = is_showing_pilots ? spr_HUI_character : ds_grid_get(allships, trakying_ship, status.sprite);
	var _spriteName = sprite_get_name(_spriteIndex);
	// Remove the "spr_" prefix
	_spriteName = is_showing_pilots ? _pilots_names[trakying_ship] : string_delete(_spriteName, 1, 4);
			
	draw_text_ext_color(400, 448, _spriteName,string_height("M"),300,cA,cA,cA,cA,1);
}
// creating buttons 
var _clicked_button = buttons_data_set(_upsidebutton_data);

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
						scr_selection_save_system();
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

	
	
	draw_sprite_ext(spr_coin,0,128,96,0.2,0.2,image_angle,image_blend,image_alpha);
	draw_sprite_ext(Spr_diamont,0,288,96,0.6,0.6,image_angle,image_blend,image_alpha);
	draw_text_ext_color(180, 100,global.player_coin, 10,300,cA,cA,cA,cA,1);
	draw_text_ext_color(340, 100,global.player_diamond, 10,300,cA,cA,cA,cA,1);
	draw_set_font(-1);

#endregion
#endregion 
}

// go to pos fase 
if Ogame.is_showing_posphase
{
// Creating the  area 
draw_set_alpha(0.8);
	draw_rectangle_color(0,0,room_width,room_height,C,C,C,C,false);
draw_set_alpha(1);
//draw background of pos phase
var _pos_fase_elements = [
	[spr_vertical_panel,    57,  75,  1.04972,1.04972],
	[Spr_tab02,             160, 297, 1.72,   1.15],
	[Spr_tab02,             178, 384, 1.42,   1.33],
	[spr_coin ,             173, 309, 0.25,   0.25],
	[Spr_close,             345, 405, 0.5,    0.5 ],
	
	
];
var _array_bg_size = array_length(_pos_fase_elements);
	for (var i = 0; i < _array_bg_size; i ++) {
		var _arrayindex = _pos_fase_elements[i];
		var _sprite = _arrayindex[0];
		var _x = _arrayindex[1];
		var _y = _arrayindex[2];
		var _xscale = _arrayindex[3];
		var _yscale = _arrayindex[4];
		
	    draw_sprite_ext(_sprite,0,_x,_y,_xscale,_yscale,image_angle,image_blend,image_alpha);
			
	}


//ALL TEXTS
draw_set_font(Fnt_Menu_description);
var _text_height = string_height("M");
draw_text_ext_transformed_color(257,239, score,   _text_height,300,1.5,1.5,0,cA,cA,cA,cA,1);
	draw_text_ext_transformed_color(230,315, global.player_coin,   _text_height,300,1.5,1.5,0,cA,cA,cA,cA,1);
		draw_text_ext_transformed_color(305,398, 2 ,   _text_height,300,3,3,0,cA,cA,cA,cA,1);
			draw_text_ext_transformed_color(150,805, "STATISTICS" ,   _text_height,300,3,3,0,c_yellow,cA,c_purple,cA,1);
#region // points convection into money 
// Desativa a camada "control_layer" no jogo // para o player não atirar nem andar
instance_deactivate_layer("control_layer");

#endregion
// buttons drawn
var _pos_phase_buttonsData = [	
	[spr_return,     165, 614, 1.5, 1.5],
	[Spr_home,       272, 630, 0.6, 0.6],
	[spr_nextbutton, 394, 614, 1.5, 1.5],
	[spr_video,      190, 392, 0.49,0.49],
];
var _array_bt_size = array_length(_pos_phase_buttonsData);
	for (var j = 0; j < _array_bt_size; j++) {
	    var _btindex = _pos_phase_buttonsData[j];
		var _bt_sprite = _btindex[0]
		var _bt_x = _btindex[1];
		var _bt_y = _btindex[2];
		var _bt_yscale = _btindex[3];
		var _bt_xscale = _btindex[4];
		
		draw_sprite_ext(_bt_sprite,0,_bt_x,_bt_y,_bt_xscale,_bt_yscale,image_angle,image_blend,image_alpha);
	}
	
	var clicked_button = buttons_data_set(_pos_phase_buttonsData);
	
	if clicked_button != -1
	{
		switch(clicked_button)
		{
			case 0 : Ogame.is_showing_posphase = false; break;
			case 1 : show_message("home") room_goto(rm_Mapa); break;
			case 2 : show_message("next") room_goto(rm_Hightspeed); break;
			case 3 : show_message("video") score_multiplier +=2; break;
		
		}
	}
	
	// Variáveis para configuração
	var conversion_rate = 0.1215; // Taxa de conversão: 0.1215 moedas por ponto
	var conversion_speed = 0.1;   // Ajuste a velocidade da conversão conforme necessário
	// Variável para armazenar o som de moedas

	// Variáveis de controle
	var is_converting = false;    // Flag para indicar se a conversão está ocorrendo

	// No evento Step do mesmo objeto
	if (score > 0) {
	    var score_to_convert = min(score, ceil(score * conversion_speed));
	    var coin_to_add = score_to_convert * conversion_rate;
    
	    if (!audio_is_playing(_snd_coin) && !is_converting) {
	        audio_play_sound(_snd_coin, 1, true);
	    }
    
	    if (coin_to_add > score * conversion_rate) {
	        coin_to_add = score * conversion_rate;
	    }
    
	    total_converted += ceil(coin_to_add); // Adicionar ao valor total convertido
	    global.player_coin += ceil(coin_to_add);
	    score -= score_to_convert;
	    is_converting = true;
	} else {
	    audio_pause_sound(_snd_coin);
	    is_converting = false;
	}

	// Após a conversão ser concluída
	if (score == 0 && score_multiplier > 0 && total_converted > 0) {
	    audio_resume_sound(_snd_coin);
    
	    var multiplied_total = (total_converted * score_multiplier) - total_converted; // Valor total multiplicado
    
	    // Verificar quanto pode ser adicionado com base na taxa de conversão
	    var total_to_add = min(multiplied_total, ceil(multiplied_total * conversion_speed));
    
	    // Adicionar o valor gradualmente
	    global.player_coin += total_to_add;
    
	    // Atualizar o valor total multiplicado
	    multiplied_total -= total_to_add;
    
	    // Se ainda houver valor para adicionar, manter o total_converted e score_multiplier para a próxima iteração
	    if (multiplied_total > 0) {
	        total_converted = multiplied_total;
	    } else {
	        audio_stop_sound(_snd_coin);
	        total_converted = 0;
	        score_multiplier = 0; // Resetar o multiplicador após a adição completa
	    }
	}

}










