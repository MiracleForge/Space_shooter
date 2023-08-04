/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var scale_speed = 0.1;

// If the planet is not selected and the scale is greater than or equal to the desired value,
// the planet returns to its normal size
if (!planet_select && image_xscale >= planet_scale) {
    var targetScale = planet_scale;
    image_xscale = lerp(image_xscale, targetScale, scale_speed);
    image_yscale = lerp(image_yscale, targetScale, scale_speed);
}
// If the current planet is the desired planet and is selected
else if (!global.open_gui && planet_unlocked && planet_id == id && planet_select) {
    // Gradually increase the scale if it is not at the maximum value (3)
    if (image_xscale < 3 && skake_initialized) {
        var maxScale = 3;
        image_xscale = lerp(image_xscale, maxScale, scale_speed);
        image_yscale = lerp(image_yscale, maxScale, scale_speed);
    } else if (!global.open_gui) and skake_initialized{
        global.open_gui = true; // Opens the GUI when it reaches the final size
    }
}

// Shaking when a new planet is unlocked
if (planet_unlocked && !skake_initialized) {
    // Check if the audio has finished playing and set skake_initialized to true
    if (!audio_is_playing(snd_achieviment) && planet_unlocked && audio_is_paused(snd_galaxy_ambient)) {
        audio_play_sound(snd_impact, 2, false);
        skake_initialized = true;
        audio_play_sound(snd_galaxy_ambient, 1, true);
        image_xscale = planet_scale;
        image_yscale = planet_scale;
    }

    // Pause the background sound "snd_galaxy_ambient"
    audio_pause_sound(snd_galaxy_ambient);

    // Shake the planet
    x = prev_x + irandom_range(-3, 3);
    y = prev_y + irandom_range(-3, 3);

    // Only increase the scale when shaking is true
    if (skake_initialized) {
        image_xscale += scale_speed;
        image_yscale += scale_speed;
    }

    // Check if the audio is not playing
    if (!audio_is_playing(snd_achieviment) && global.audio_is_playing) {
        global.audio_is_playing = false;
        audio_play_sound(snd_achieviment, 1, false);
    }
}









