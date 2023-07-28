/// @description DRAW_GUI_UI
// Você pode escrever seu código neste editor

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
if room == rm_Game {
    // HUI elements


    // Draw Heat Capacity
    draw_sprite_ext(spr_GunHeat, 0, 50, 260, _scale, _scale, 0, c, 1);
    
    if instance_exists(O_ship_parent) {
        var maxHeat = O_ship_parent.maxHeat;
        var currentHeat = O_ship_parent.heat;
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

#region Life bars and Shield bars

draw_sprite_ext(spr_HUI_lifebar, 0, 150, 80, _scale, _scale, 0, c, 1);
//score
    draw_text_transformed_colour(200, 186, score, 2, 2, 0,cA, cA, cA, cA, 1);
    draw_text_transformed_colour(90, 185, "Score", 2, 2, 0,cA, cA, cA, cA, 1);

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
if pick_ship and room == rm_Game
{
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
	

    draw_rectangle_color(0, 0, 720, 1280, C, p, cA, C, false); //back color
    draw_sprite_ext(spr_back_menu, 0, rm_w, rm_h, 24, 24, 0, c, 1); //background rectangle
    draw_sprite_ext(spr_display_ship, 0, _display_x, _display_y, _scale, _scale, 0, c, 1); // rectangle

// Verifica se o jogador está escolhendo sua nave (choose_ship é verdadeira).
    if choose_ship // player is choosing their ships
    {
		// Nesse caso, desenha o sprite da nave selecionada com base na variável "trakying_ship".
       // Cada número representa uma nave específica.
        switch (trakying_ship)//draw ship
        {
            case 1:
                draw_sprite_ext(spr_USS_Cerulean, 0, porttrait_posX,porttrait_posY, _scale, _scale, targetAngle, c, 1);
                break;
            case 2:
                draw_sprite_ext(spr_USS_Emberstrike, 0, porttrait_posX, porttrait_posY, _scale, _scale, targetAngle, c, 1);
                break;
            case 3:
                draw_sprite_ext(spr_USS_Verdant_Shield, 0, porttrait_posX, porttrait_posY, _scale, _scale, targetAngle, c, 1);
                break;
        }
    }
    else
    {
	// Caso o jogador esteja escolhendo um personagem (choose_ship é falsa),
    // desenha o sprite do personagem selecionado com base na variável "Pyframe_icon".
    // Cada número representa um personagem específico.
        switch (Pyframe_icon) // draw characters
        {
            case 0:
                draw_sprite_ext(spr_HUI_character, 0, porttrait_posX, porttrait_posY, _scalahalf , _scalahalf, 0, c, 1);
                break;
            case 1:
                draw_sprite_ext(spr_HUI_character, 1, porttrait_posX, porttrait_posY, _scalahalf, _scalahalf, 0, c, 1);
                break;
            case 2:
                draw_sprite_ext(spr_HUI_character, 2, porttrait_posX, porttrait_posY, _scalahalf, _scalahalf, 0, c, 1);
                break;
            case 3:
                draw_sprite_ext(spr_HUI_character, 3, porttrait_posX, porttrait_posY, _scalahalf, _scalahalf, 0, c, 1);
                break;
            case 4:
                draw_sprite_ext(spr_HUI_character, 4, porttrait_posX, porttrait_posY, _scalahalf, _scalahalf, 0, c, 1);
                break;
            case 5:
                draw_sprite_ext(spr_HUI_character, 5, porttrait_posX, porttrait_posY, _scalahalf, _scalahalf, 0, c, 1);
                break;
            case 6:
                draw_sprite_ext(spr_HUI_character, 6, porttrait_posX, porttrait_posY, _scalahalf, _scalahalf, 0, c, 1);
                break;
            case 7:
                draw_sprite_ext(spr_HUI_character, 7, porttrait_posX, porttrait_posY, _scalahalf, _scalahalf, 0, c, 1);
                break;
            case 8:
                draw_sprite_ext(spr_HUI_character, 8, porttrait_posX, porttrait_posY, _scalahalf, _scalahalf, 0, c, 1);
                break;
        }
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
    var previous_button = point_in_rectangle(_mx, _my, 300, 600, 340, 680);
    var next_button = point_in_rectangle(_mx, _my, 450, 600, 480, 680);

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
 

        pick_ship = false; // Saindo do menu de seleção
        instance_create_layer(rm_w, 1070, "instances", ship_dict[trakying_ship]);
		
		
    }
}
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
    draw_surface(paused_surf, 0, 0);
    draw_set_alpha(0.5);
    draw_rectangle_colour(0, 0, room_width, room_height, C, C, C, C, false);
    draw_set_alpha(1);
    draw_set_halign(fa_center);
    draw_text_transformed_colour(room_width / 2, room_height / 2, "PAUSED", 2, 2, 0,cA, cA, cA, cA, 1);
    draw_set_halign(fa_left);
	
    
}
}
#endregion

#region //debuging area

#region // contador de instancias
// Variável para armazenar o número de instâncias do objeto OaideShip
var oaideShipCount = 0;

// No evento Step ou Draw
oaideShipCount = instance_number(O_missile);
draw_text(x, y, "Quantidade de OaideShip: " + string(oaideShipCount));
#endregion
draw_text_ext_transformed(0,0,fps_real,1,10,3,3,0);

#endregion

