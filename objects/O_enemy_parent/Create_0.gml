/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
image_xscale = 0.3
image_yscale = 0.3;
vspeed = 2 + global.level;

life = 5 + global.level;


enemy_direction = false;

if (surface_format_is_supported(surface_rgba16float))
{
scr_create_light(x,y,c_yellow,0.3,1.8,1.8,id);
}