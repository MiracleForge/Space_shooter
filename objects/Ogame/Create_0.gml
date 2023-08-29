/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// aspect ratio and camera e room size
/*global.res_width = 720;
global.res_height = 2400;

var _ratio = global.res_width / global.res_height;
var _display_ratio = display_get_gui_width() / display_get_gui_height();

if (_display_ratio < _ratio){
    global.res_height = 2400; // Optional

    global.res_width = global.res_height * _display_ratio;
}
*/
randomize();
//ship selection
pick_ship = true;
cameratarget = O_ship_parent;

// effects
shake = false;
shake_time = 0;
shake_magnitude = 0;
shake_fade = 0.25;
//global variables
global.level = 1;
global.pause = false;
global.dialog_down = false;
score = 5847;
global.player_coin = 0;
global.player_diamond = 0;
scr_load_system();




global.speedo = 0;
global.heat = 0;
global.attack = 0;
global.shield = 0;
global.armor = 0; 
global.special = 0;



pos_fase = false;

// surface draw
paused_surf = -1;
light_mode_light = true // turn on light mode
// size of the shield bars
lenght_shieldBar = 0;
betterlight = true;
isoundOn = true;
settings = false;
posx_volume = 540;
isAdjustingVolume = false;
iskillTreeopen = false;
pick_ship = true; // selection screen window open
Pyframe_icon = 0;
//chamadas
boss_killed = false;

test = -1

scr_load_system();
is_showing_posphase = false;