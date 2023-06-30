/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var _ship = O_ship_parent;
if enemy_type == 3
{
	if instance_exists(_ship)
	{
	   instance_create_layer(_ship.x, _ship.y, "Instances", O_enemy_lazer);
	}
}else if (enemy_type == 4) {
            var _miss = instance_create_layer(x + 35, y + 10, "Instances", O_enemy_mine);
            if (instance_exists(_miss)) {
                _miss.speed = 6;
                _miss.direction = image_angle;
                _miss.image_angle = direction;
    
                var randomPitch = random_range(0.8, 10);
                audio_sound_pitch(snd_missile_launcher, randomPitch);
                audio_play_sound(snd_missile_launcher, 0, false);
    
                alarm[0] = 20;
            }
        }