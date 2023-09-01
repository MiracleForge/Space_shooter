/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
image_xscale = 0.3;
image_yscale = 0.3;

enum enemy_attk
{
	spread,
	slow,
	especial,
	waiting
	
}
enum enemy_mov
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
// sctructor who keeps the time to shoot
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
	_max : 2,
	_current : 2,
	
}
attkState = enemy_attk.waiting;
movState = enemy_mov.distance;


enemy_direction = false;
damage_alpha = -1;
flash_t = 0;














