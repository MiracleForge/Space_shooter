/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
image_xscale = 0.3;
image_yscale = 0.3;

image_angle = 270;
ship_life = 5;
positionY = 100;
enum stalker_attk
{
	spread,
	slow,
	especial,
	waiting
	
}
enum stalker_mov
{
	intro,
	distance,
	medium_range,
	dash,
	retreate,
	leaving,
	dying
	
}


// structor to ship characteristics
position =
{	
	next:	
	{	
		_x: 0,
		_y: 0,
	},	
};
// time to shoot
timers = 
{
	shooting:
	{
		_max: game_get_speed(gamespeed_fps) * 1,
		_current: 0,
	},
};

hitpoints = 
{
	_max : 25,
	_current : 25,
	
}
attkState = stalker_attk.waiting;
movState = stalker_mov.distance;



damage_alpha = -1;
flash_t = 0;










