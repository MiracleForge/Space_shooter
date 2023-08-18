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
global.player_coin = 1000;
global.player_diamond = 10;
global.speedo = 0;
global.heat = 0;
global.attack = 0;
global.shield = 0;
global.armor = 0; 
global.special = 0;

// UI
Pyframe_icon = 0;
max_Pyframe_icon = 8;
trakying_ship = 0;
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


enum ships {
    USS_Cerulean,
    USS_EmberStrike,
    USS_Emerald_Warhammer,
	USS_ShadowStrike,
    USS_thunderCore,
    ships_height
}

enum status {
	sprite,
    Block,
    Money,
    Diamonds,
    Heart,
    Shield,
	Speed,
	Description,
    status_height
}

 number_of_ships = ships.ships_height;
allships = ds_grid_create(ships.ships_height, status.status_height);

shipdataBase = [
    [spr_USS_Cerulean,false,0,0,4,25,3],
    [spr_USS_Emberstrike, false,0,0,4,15,2],
    [spr_USS_Verdant_Shield,true,500,10,5,15,1.5],
    [spr_USS_Shadowstrike, true, 1000, 50,3,30,4],
    [Spr_USS_Thundercore, true, 3000,70,3,25,2]
];

ship_description_dataBase = [
	
];
for (var i = 0; i < array_length(shipdataBase); i++) {
    var shipData = shipdataBase[i];
    var shipIndex = i; // Use the loop index as the ship's enumeration value
    var shipStatus = shipData[1];
    var sprite = shipData[0];
    var money = shipData[2];
    var diamonds = shipData[3];
    var heart = shipData[4];
    var shield = shipData[5];
	var _speed = shipData[6];

    ds_grid_add(allships, shipIndex, status.sprite, sprite);
    ds_grid_add(allships, shipIndex, status.Block, shipStatus);
    ds_grid_add(allships, shipIndex, status.Money, money);
    ds_grid_add(allships, shipIndex, status.Diamonds, diamonds);
    ds_grid_add(allships, shipIndex, status.Heart, heart);
    ds_grid_add(allships, shipIndex, status.Shield, shield);
    ds_grid_add(allships, shipIndex, status.Speed, _speed);
}
number_of__ndisplay = noone;
confirm_buy = false;
denied_money = 0
conj_clicked = 0;
is_show_ship_status = true;