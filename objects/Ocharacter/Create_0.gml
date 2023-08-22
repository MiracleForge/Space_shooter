/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Ships traking control variable
trakying_ship = 0;
// Scoll control variables
scrollpos = 0;
mouse_yprevious = 0;
// Others
// records the position of the iteration inside the loop that creates the sets
number_of__ndisplay = noone; 
 //Opens the ship or pilots purchase window
confirm_buy = false;
 // Controls whether the purchase was approved or denied by the system
purchase_denied = 0;
//Records which of the sets the player is currently interacting with
conj_clicked = 0;
// controls what is shown on the screen
is_show_ship_status = true;
is_showing_pilots = true;

// Controls ship rotation on selection screen
rotationSpeed = 2;
targetAngle = 90;

#region Grid all ships , conten all ships show in the selection character 
// enumerator that contains all ships to traking the grid
enum ships {
    USS_Cerulean,
    USS_EmberStrike,
    USS_Emerald_Warhammer,
    USS_ShadowStrike,
    USS_ThunderCore,
    ships_height
}
//enumerator that contains all ships sub coluns in the grid allships
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
// this variable controls the size of the loop for creating sets
number_of_ships = ships.ships_height;
// this array contains all the characteristics of each ship for character selection
var shipdataBase = [
    [spr_USS_Cerulean,false,0,0,4,25,3],
    [spr_USS_Emberstrike, false,0,0,4,15,2],
    [spr_USS_Verdant_Shield,true,500,10,5,15,1.5],
    [spr_USS_Shadowstrike, true, 1000, 50,3,30,4],
    [Spr_USS_Thundercore, true, 3000,70,3,25,2],

];
//this loop fills the entire allships grid
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
#endregion

#region Grid allpilots, has all pilots options and grid loop to fills
// This variable controls the height of grid allpilots, using the total numbers of frames
number_of_pilots = sprite_get_number(spr_HUI_character);
enum pilots
{
	Block,
	Money,
	Diamonds,
	Description,
	pilots_height
}
 // this array contains all the characteristics of each pilots for character selection
var _pilots_dataBase = [
	[false,0,0,"Ethan Nova -- atributes,"],
	[true, 2000,100,"name 1"],
	[true, 3000,150,"name 2"],
	[true, 4000,200,"namet 3"],
	[true, 5000,250,"name 4"],
	[true, 6000,300,"history of pilot 5"],
	[true, 7000,350,"history of pilot 6"],
	[true, 8000,400,"history of pilot 7"],

]

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
#endregion













