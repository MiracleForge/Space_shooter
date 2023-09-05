// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_shield_default() {
    if (!instance_exists(Oshield)) {
        instance_create_layer(x, y, "layer_under", Oshield);
    }

    if (shield == 0) {
        shield_active = false;
        audio_play_sound(snd_shield_broken, 0, false);
    }

    if (!shield_active && shield != max_shield) {
        shield += shield_recover_max;
        if (shield >= max_shield) {
            shield = max_shield; // Limita o escudo ao valor máximo
            shield_active = true;
            audio_play_sound(snd_shield_recover, 0, false);
        }
    }
}
