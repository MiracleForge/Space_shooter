/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event

vspeed = 2
event_inherited();

x = choose( 720, 0)

event_inherited();


if x == 0 {	
	enemy_direction = false;
	}else 
	{
	enemy_direction = true;	
	}

attkState = enemy_attk.waiting;
movState = enemy_mov.intro;