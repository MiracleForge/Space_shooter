/// @description time to automatic explosion
// Você pode escrever seu código neste editor
explosion_range = false;
if (!audio_is_playing(snd_impact)) {
    var sound_instance = audio_play_sound(snd_impact, 1, false, 0.4);
    audio_sound_gain(sound_instance, 0.2,10); // Volume do eco (ajuste conforme necessário)
    audio_sound_pitch(sound_instance, 1.0); // Ajuste o tom conforme necessário
 
    
    // Crie um loop para reproduzir o som com atraso para simular o eco
    for (var i = 1; i < 5; i++) {
        audio_play_sound(snd_impact, 1, false, 0.2, 0.1 * i); // Ajuste o atraso conforme necessário
    }
}


effect_create_above(ef_ellipse, x, y, 4, c_red);
effect_create_above(ef_flare, x, y, 1, c_red);
instance_destroy();
