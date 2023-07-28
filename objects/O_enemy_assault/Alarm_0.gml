/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if  instance_number(O_enemy_mine) <= 10
{
            var _miss = instance_create_layer(x + 35, y + 10, "Enemy_layer", O_enemy_mine);
                _miss.speed = random_range(6,9);
                _miss.direction = image_angle;
                _miss.image_angle = direction;
    
                var _random_pitch = random_range(0.8, 10);
                audio_sound_pitch(snd_missile_launcher, _random_pitch);
                audio_play_sound(snd_missile_launcher, 0, false);
    
				 alarm[0] = 20;
}







