/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// aspect ratio and camera e room size
global.res_width = 720;
global.res_height = 1280;

var _ratio = global.res_width / global.res_height;
var _display_ratio = display_get_width() / display_get_height();

if (_display_ratio < _ratio){
    global.res_height = 1280; // Optional

    global.res_width = global.res_height * _display_ratio;
}

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


// effects
shake = false;
shake_time = 0;
shake_magnitude = 0;
shake_fade = 0.25;
//global variables
global.level = 1;
global.pause = false;
score = 0;

Pyframe_icon = 0;
max_Pyframe_icon = 8;
trakying_ship = 1;
max_trakying_ship = 3;
choose_ship = true;

test = false;

// surface draw
paused_surf = -1;
// size of the shield bars
lenght_shieldBar = 0;

//chamadas
boss_killed = false;





