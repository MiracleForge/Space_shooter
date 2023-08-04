/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Verifica se o planeta está desbloqueado (substitua "planet_unlocked" pelo array que contém os estados de desbloqueio dos planetas)

draw_self();
if !planet_unlocked and !global.open_gui
{
	image_speed = 0;
    var planet_width = sprite_get_width(sprite_index);
    var planet_height = sprite_get_height(sprite_index);

    // Desenha a sprite do planeta

    // Verifica se o planeta está bloqueado (substitua "planeta_bloqueado" pela variável que define se o planeta está bloqueado)

    // Desenha a sprite do cadeado com as mesmas dimensões do planeta
    var lock_scale_x = planet_width / sprite_get_width(Spr_lock);
    var lock_scale_y = planet_height / sprite_get_height(Spr_lock);
    draw_sprite_ext(Spr_lock, 0, x, y, lock_scale_x, lock_scale_y, 0, c_white, 1);
}else
{
		image_speed = -1;
		scr_blend_light(360,50,6,image_xscale,image_yscale,image_angle,image_blend,0.05,false)
}

/*
if (planet_unlocked and !skake_initialized)
{
		scr_blend_light(360,50,6,image_xscale,image_yscale,image_angle,image_blend,0.1,true)
   
}









