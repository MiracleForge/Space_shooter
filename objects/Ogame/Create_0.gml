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
global.player_coin = 10000;
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
    USS_ThunderCore,
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
    status_height
}

allships = ds_grid_create(ships.ships_height, status.status_height);
number_of_ships = ships.ships_height;

var shipdataBase = [
    [spr_USS_Cerulean,false,0,0,4,25,3],
    [spr_USS_Emberstrike, false,0,0,4,15,2],
    [spr_USS_Verdant_Shield,true,500,10,5,15,1.5],
    [spr_USS_Shadowstrike, true, 1000, 50,3,30,4],
    [Spr_USS_Thundercore, true, 3000,70,3,25,2],

];

for (var i = 0; i < array_length(shipdataBase); i++) {
    var _shipData = shipdataBase[i];
    var _shipIndex = i;
    var _shipStatus = _shipData[1];
    var _sprite = _shipData[0];
    var _money = _shipData[2];
    var _diamonds = _shipData[3];
    var _heart = _shipData[4];
    var _shield = _shipData[5];
    var _speed = _shipData[6];

    ds_grid_add(allships, _shipIndex, status.sprite, _sprite);
    ds_grid_add(allships, _shipIndex, status.Block, _shipStatus);
    ds_grid_add(allships, _shipIndex, status.Money, _money);
    ds_grid_add(allships, _shipIndex, status.Diamonds, _diamonds);
    ds_grid_add(allships, _shipIndex, status.Heart, _heart);
    ds_grid_add(allships, _shipIndex, status.Shield, _shield);
    ds_grid_add(allships, _shipIndex, status.Speed, _speed);
}

number_of__ndisplay = noone;
confirm_buy = false;
denied_money = 0
conj_clicked = 0;
is_show_ship_status = true;

enum pilots
{
	Block,
	Money,
	Diamonds,
	Description,
	pilots_height
}
 
var _pilots_dataBase = [
	[false,0,0,"history of pilot 0"],
	[true, 2000,100,"history of pilot 1"],
	[true, 3000,150,"history of pilot 2"],
	[true, 4000,200,"history of pilot 3"],
	[true, 5000,250,"history of pilot 4"],
	[true, 6000,300,"history of pilot 5"],
	[true, 7000,350,"history of pilot 6"],
	[true, 8000,400,"history of pilot 7"],

]


number_of_pilots = sprite_get_number(spr_HUI_character);
allpilots = ds_grid_create(number_of_pilots , pilots.pilots_height);

for (var j = 0; j < array_length(_pilots_dataBase); j++) {
    var _pilotsData = _pilots_dataBase[j];
    var _pilotsIndex = j;
    var _pilotsStatus = _pilotsData[0];
    var _pilotsmoney = _pilotsData[1];
    var _pilotsdiamonds = _pilotsData[2];
	var _pilotdesc = _pilotsData[3];
  
  ds_grid_add(allpilots, _pilotsIndex, pilots.Block,    _pilotsStatus);
  ds_grid_add(allpilots, _pilotsIndex, pilots.Money,    _pilotsmoney);
  ds_grid_add(allpilots, _pilotsIndex, pilots.Diamonds, _pilotsdiamonds);
  ds_grid_add(allpilots, _pilotsIndex, pilots.Description, _pilotdesc);
}

is_showing_pilots = true;