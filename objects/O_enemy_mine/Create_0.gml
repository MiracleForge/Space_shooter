/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
image_xscale = 6;
image_yscale = 6;
if (surface_format_is_supported(surface_rgba16float))
{
//scr_create_light(x ,y ,c_red,2,2,2,id);
}

alarm[0] = 360; // time to exploud

explosion_range = false; // activado somente quando o player se aproxima
increment = 0; // contador para inflação e deflação
is_incrementing = true; // controle do estado da inflação
mineEff = false; // ativa o efeito shiny
damage_alpha = -1;
enum STATES_MINE
{
	UNARMED,
	ARMED,
}
minestates = STATES_MINE.UNARMED