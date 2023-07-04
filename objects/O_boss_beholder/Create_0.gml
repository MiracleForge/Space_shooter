/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
instance_create_depth(x,y,-200,Oalert_room);
image_xscale = 6;
image_yscale = 6;
//moviment
//h_speed = 0;
//v_speed = 0;
//veloc = 2;

//intro
positionY = 180;

beholder_life = 150;
max_beholder_life = 150;
//state machine
enum BOSSmov_state	
{
	intro,
	phase_one,
	phase_two,
	phase_three,
	mov_aleatory,
	dying
	
}

enum BOOSshot_state
{
	waiting,
	slow,
	slowpar,
	circle,
	rapidfire,
	aleatory
}

enum Sounds
{
	lazer = 40,
	hits = 50,
}
// struction for position and next positions 
position =
{	
	next:	
	{	
		_x: 0,
		_y: 0,
	},	
};

timers = 
{
	shooting:
	{
		_max: game_get_speed(gamespeed_fps) * 1,
		_current: 0,
	},
};

attkState = BOOSshot_state.waiting;
movState = BOSSmov_state.intro; // first state apparence
//bombs
//alarm[0] = 30;


