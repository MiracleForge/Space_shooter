/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
image_xscale = 6;
image_yscale = 6;
if (surface_format_is_supported(surface_rgba16float))
{
scr_create_light(x ,y ,c_red,2,2,2,id);
}

alarm[0] = irandom(60);
detonation_distance = 50;
close_distance = 20;
explosion_range = false;

enum STATES_MINE
{
	UNARMED,
	ARMED,
	EXPL
}
minestates = STATES_MINE.UNARMED