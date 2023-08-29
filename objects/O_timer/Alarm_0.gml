/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
t_mil -=1;

if t_mil = -1
{
	t_mil = 9;
	t_sec -=1;
}


if t_sec = -1
{
	t_sec = 59;
	t_min -= 1;
}

//make sure the alarm dosen't tick if was 0
if !(t_sec = 0 and t_min = 0 and t_mil = 0)
{
	alarm[0]  = 6;	
}else 
{
	
	if room = rm_game_1_1 and !instance_exists(O_boss_beholder) 
	{
		
		instance_create_layer(380, -180,"instances",O_boss_beholder);
	}
}









