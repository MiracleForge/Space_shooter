/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();

  if (alarm[0] == -1) 
  {
            var _miss = instance_create_layer(x + 35, y + 10, "Enemy_layer", O_enemy_machine_gun);
                _miss.speed = (enemy_direction) ? -6 : 6; // change direction if payback respaw true
                _miss.direction = direction;
                _miss.image_angle = direction;
        
                var _random_pitch = random_range(0.8, 10);
                audio_sound_pitch(snd_missile_launcher, _random_pitch);
                audio_play_sound(snd_missile_launcher, 0, false);
        
                alarm[0] = 280;
  }
		

