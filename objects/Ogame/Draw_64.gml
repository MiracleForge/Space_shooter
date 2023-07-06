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
//collours
var c = c_white;
var C = c_black;
var cA = c_aqua;
var p = c_purple;
//Player Ships sprits
var _ship01 = spr_USS_Cerulean;
var _ship02 = spr_USS_Emberstrike;
var _ship_pai =O_ship_parent;

#endregion

// HUI elements 
#region DRAW_UI

#region  //HEAT CAPACITY
draw_sprite_ext(spr_GunHeat, 0, 50, 260, _scale, _scale , 0, c, 1);
if instance_exists(O_ship_parent) {
//Heat bars
var maxHeat = O_ship_parent.maxHeat;
var currentHeat = O_ship_parent.heat;
// shields bars
var max_shield = O_ship_parent.max_shield;
var current_shield = O_ship_parent.shield;
var barHeight = (currentHeat / maxHeat) * _scale ;
var barShield = (current_shield / max_shield) * _scale

draw_sprite_ext(spr_GunHeatBar, 0, 50, 260, _scale, barHeight, 0, c, 1);
draw_sprite_ext(spr_HUI_lifebar, 1, 150, 80, _scale, barShield, 0, c, 1);
}
#endregion // END HEAT CAPACITY

#region Item slots
var pos_x = 80;
repeat(3)
{	
	draw_sprite_ext(spr_HUI_rectangle, 0, pos_x, 140, _scale/1.8, _scale/1.8 , 0, c, 1);
	pos_x += 60;
}
#endregion //END ITEM SLOTS

#region Player portrait

draw_sprite_ext(spr_HUI_character, Pyframe_icon, 30, 33, _scale *1.7, _scale *1.7 , 0, c, 1);
draw_sprite_ext(spr_HUI_porttrait, 0, 15, 15, _scale *1.2, _scale *1.2 , 0, c, 1);
#endregion // END PORTRAIT

#region Life bars and Shield bars

draw_sprite_ext(spr_HUI_lifebar, 0, 150, 80, _scale, _scale, 0, c, 1);
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
/*
draw_sprite_ext(Spr_HUI_shield, 0, 430 + (lenght_shieldBar /10) , 75, _scale *1.2, _scale *1.2 , 0, c, 1);
*/
#endregion

#endregion ////END UI

#region // Player selection screen
if pick_ship {
// Ship USS Cerulean
var _ship01_L = sprite_get_width(_ship01) * _scale;
var _ship01_A = sprite_get_height(_ship01) * _scale;
var _guiship01_L =  _guiL/2.4 - _ship01_L/2;  // dividir o tamanho da sprite 
var _guiship01_A = _guia/2 - _ship01_A/2;
// USS Emberstrike
var _ship02_L = sprite_get_width(_ship02) * _scale;
var _ship02_A = sprite_get_height(_ship02) * _scale;
var _guiship02_L =  _guiL/1.2 - _ship02_L/2;  // dividir o tamanho da sprite 
var _guiship02_A = _guia/2 - _ship02_A/2;

draw_rectangle_color(0,0,720, 1280, C,p,cA,C,false);
// Verificar se o mouse está na posição desejada

if point_in_rectangle(_mx, _my, (_guiship01_L + 50) - _ship01_L, (_guiship01_A + 50) - _ship01_A, _guiship01_L + 50, _guiship01_A + 50)
{
	
    draw_sprite_ext(_ship01, 0, _guiship01_L, _guiship01_A, _scale, _scale, targetAngle, c, 1);
    draw_sprite_ext(_ship02,0,_guiship02_L,_guiship02_A,_scale,_scale,90,c,1);
	if ship_snd_select == false{
	audio_play_sound(snd_menu_click,0,false);
	ship_snd_select = true;
	}
	}else if point_in_rectangle(_mx, _my, (_guiship02_L + 50) - _ship02_L, (_guiship02_A + 50) - _ship02_A, _guiship02_L + 50, _guiship02_A + 50){
		draw_sprite_ext(_ship01, 0, _guiship01_L, _guiship01_A, _scale, _scale, 90, c, 1);
	    draw_sprite_ext(_ship02,0,_guiship02_L,_guiship02_A,_scale,_scale,targetAngle,c,1);
		if ship_snd_select == false{
		audio_play_sound(snd_menu_click,0,false);
		ship_snd_select = true;
		}
}else
	{
	draw_sprite_ext(_ship01,0,_guiship01_L,_guiship01_A,_scale,_scale,90,c,1);
	draw_sprite_ext(_ship02,0,_guiship02_L,_guiship02_A,_scale,_scale,90,c,1);
	ship_snd_select = false;
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


