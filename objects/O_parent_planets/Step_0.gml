/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


var scale_speed = 0.1;

// Se o planeta não está selecionado e a escala é maior ou igual ao valor desejado 
//o planeta volta ao tamanho normal
if (!planet_select and image_xscale >= planet_scale) {
    image_xscale = lerp(image_xscale, planet_scale, scale_speed);
    image_yscale = lerp(image_yscale, planet_scale, scale_speed);
}
// Se o planeta atual for o planeta desejado e estiver selecionado
else if (planet_unlocked and planet_id == id and planet_select) {
    // Aumenta gradualmente a escala se ainda não estiver no valor máximo (3)
    if (image_xscale < 3) {
        image_xscale = lerp(image_xscale, 3, scale_speed);
        image_yscale = lerp(image_yscale, 3, scale_speed);
    } else {
        open_gui = true; // no tamanho final abre o GUI
    }	
}

//  shaking quando libera um novo planeta
if (planet_unlocked and !skake_initialized)
{
    // Verifica se o áudio terminou de tocar e define skake_initialized como verdadeiro
    if (!audio_is_playing(snd_achieviment) and planet_unlocked and audio_is_paused(snd_galaxy_ambient))
    {
        audio_play_sound(snd_impact, 2, false);
        skake_initialized = true;
        audio_play_sound(snd_galaxy_ambient, 1, true);
        image_xscale = planet_scale;
        image_yscale = planet_scale;
    }

    // Pausa o som do fundo "snd_galaxy_ambient"
    audio_pause_sound(snd_galaxy_ambient);

    // Tremer o planeta
    x = prev_x + irandom_range(-3, 3);
    y = prev_y + irandom_range(-3, 3);
    image_xscale += scale_speed;
    image_yscale += scale_speed;

    // Verifica se o áudio não está tocando
    if (!audio_is_playing(snd_achieviment) and global.audio_is_playing)
    {
        
        global.audio_is_playing = false;
        audio_play_sound(snd_achieviment, 1, false);
    }
}








