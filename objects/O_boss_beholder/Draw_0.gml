/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_self();

if movState == BOSSmov_state.intro or movState == BOSSmov_state.dying or movState == BOSSmov_state.phase_pre
{
		
		return;	
}

var	bar_foreground = c_green;
var bar_background = c_black;

switch(movState)
{
	case BOSSmov_state.phase_one:
	bar_background = #4B4E6D;
	bar_background = #7FB069;
	break;
	
	case BOSSmov_state.phase_two:
	bar_background = #7FB069;
	bar_background = #D36135;
	break;
	case BOSSmov_state.phase_three:
	bar_background = #7FB069;
	bar_background = c_orange;
	break;
}

draw_healthbar(
	x -sprite_width,
	y + sprite_height,
	x + sprite_width ,
	y + sprite_width - 30,
	(beholder_life / max_beholder_life) * 100,
	bar_background,
	bar_foreground,
	bar_foreground,
	0,
	true,
	true
);