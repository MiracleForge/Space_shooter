/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();

if (keyboard_check_pressed(vk_space) && Shooting_button.alarm[0] == -1 || shoot_on)
{
    var _instY = -10;
    heat += 1;
    heat_countDown = 1;

    if (!overheat)
    {
        for (var i = 0; i < ammo; i++)
        {
            _inst = instance_create_layer(x - _instY, y - 1, "Instances", Omachinegun);
            _inst.speed = -6;
            _inst.direction = direction;
            _inst.image_angle = direction;

            _instY += 10;

            var _random_pitch = random_range(0.8, 1.2);
            audio_play_sound(snd_bullet01, 0, false);
            audio_sound_pitch(snd_bullet01, _random_pitch);
        }

        if (alarm[1] == -1)
        {
            var _miss = instance_create_layer(x - _instY, y - 1 - _instY, "Instances", O_missile);
            _miss.speed = -2;
            _miss.direction = direction;
            _miss.image_angle = direction;
            alarm[1] = 120;
            var _random_pitch = random_range(0.8, 10);
            audio_sound_pitch(snd_missile_launcher, _random_pitch);
        }
    }
    else
    {
   var  _inst = instance_create_layer(x - _instY, y - 1, "Instances", O_missile);
        _inst.speed = -8;
        _inst.direction = direction;
        _inst.image_angle = direction;

        alarm[1] = 30;
        var _random_pitch = random_range(0.8, 10);
        audio_sound_pitch(snd_missile_launcher, _random_pitch);
    }

    audio_play_sound(snd_missile_launcher, 0, false);
    shoot_on = false;
}

