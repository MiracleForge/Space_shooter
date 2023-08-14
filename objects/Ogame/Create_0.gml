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
ship_snd_select = false;
// display ship
rotationSpeed = 2;
targetAngle = 90;
cameratarget = O_ship_parent;
//creation of player ship objects
// Evento Create
ship_dict = ds_map_create();
ship_dict[1] = O_USS_Cerulean;
ship_dict[2] = O_USS_Emberstrike;
ship_dict[3] = O_USS_Emerald_Warhammer;
ship_dict[4] = O_USS_ShadowStrike;
ship_dict[5] = O_USS_ThunderCore;


// effects
shake = false;
shake_time = 0;
shake_magnitude = 0;
shake_fade = 0.25;
//global variables
global.level = 1;
global.pause = false;
global.dialog_down = false;
score = 0;
global.player_coin = 50000;
global.speedo = 0;
global.heat = 0;
global.attack = 0;
global.shield = 0;
global.armor = 0; 
global.special = 0;

// UI
Pyframe_icon = 0;
max_Pyframe_icon = 8;
trakying_ship = 1;
max_trakying_ship = 5;
choose_ship = true;
test = false;

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
//chamadas
boss_killed = false;

test = -1;

scrollpos = 0;
mouse_yprevious = 0;




