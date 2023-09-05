/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
event_inherited();
switch(movState)
{
	case enemy_mov.distance:
		// speed 
		vspeed = 3 + global.level;
		// Atualização do estado de ataque
			 if (timers.shooting._current <= 0) { // se o timer for menor que zero, a nave pode disparar
			     attkState = choose(enemy_attk.slow);
			     timers.shooting._current = timers.shooting._max;
				} else {
				 attkState = enemy_attk.waiting;
				 timers.shooting._current -= 0.1;
			    }	
	break;
}

switch(attkState)
{
	case enemy_attk.slow :
	    var _miss = instance_create_layer(x + 35, y + 10, "Enemy_layer", O_enemy_machine_gun);
           _miss.speed = (enemy_direction) ? -6 : 6; // change direction if payback respaw true
           _miss.direction = direction;
           _miss.image_angle = direction;
        
            var _random_pitch = random_range(0.8, 10);
            audio_sound_pitch(snd_missile_launcher, _random_pitch);
            audio_play_sound(snd_missile_launcher,1, false);	
	break;
}











