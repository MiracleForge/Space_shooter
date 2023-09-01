/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();
image_alpha = 0.3;
alarm[0] = 160;
alarm[1] = 1500;
//vspeed = 0; // this ship dosen't need speeds, so I reset to zero
//hspeed = 0;
//enemy_movement_time = 160; // TIME TO CHANGE STATE
//alarm[1] = enemy_movement_time; // time to change walk state

enum SNIPER
{
	
	WALK,
	STEALTH,
	CHARGING,

}

movState = SNIPER.WALK;
attkState = enemy_attk.waiting;
hitpoints = 
{
	_max : 10,
	_current : 10,
	
}

position =
{	
	next:	
	{	
		_x: irandom_range(96, room_width),
		_y: irandom_range(96, room_height),
	},	
};

timers = 
{
	shooting:
	{
		_max: game_get_speed(gamespeed_fps) * 300,
		_current: 0,
	},
};









