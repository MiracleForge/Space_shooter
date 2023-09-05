/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();
image_xscale = 3;
image_yscale = 3;

enum missil_state 
{
	off_line,
	following,
	no_target,
	explod
}
target_enemy = noone;
lock_missil = false;
missil_lockON = missil_state.off_line;
