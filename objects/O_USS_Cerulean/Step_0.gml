/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();

if (keyboard_check_pressed(vk_space) && Shooting_button.alarm[0] == -1 || shoot_on)
{
    // Código específico da nave tipo 1 para gerar projéteis
    var _instY = -10;
    heat += 1;
    heat_countDown = 1;
    if (!overheat)
    {
        for (var i = 0; i < ammo; i++)
        {
            _inst = instance_create_layer(x - _instY, y - 1, "Instances", Omachinegun);
            _inst.speed = -8;
            _inst.direction = direction;
            _inst.image_angle = direction;

            _instY += 10;

            var _random_pitch = random_range(0.8, 1.2);
            audio_play_sound(snd_bullet01, 0, false);
            audio_sound_pitch(snd_bullet01, _random_pitch);
            shoot_on = false;
        }
    }
    else
    {
        for (var i = 0; i < ammo + 2; i++)
        {
            _inst = instance_create_layer(x - _instY, y - 1, "Instances", Omachinegun);
            _inst.speed = -8;
            _inst.direction = direction;
            _inst.image_angle = direction;
            _inst.image_blend = c_red;
            _instY += 10;

            var _random_pitch = random_range(0.8, 1.2);
            audio_play_sound(snd_bullet01, 0, false);
            audio_sound_pitch(snd_bullet01, _random_pitch);
        }
    }
}


