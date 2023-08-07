/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

event_inherited();
    var _dist = 30; // Distância desejada do jogador
if Pyexist
{
	var _ship = O_ship_parent;
	var _dest_x = _ship.x;
	var _dest_y = _ship.y;

if distance_to_object(_ship) >= _dist 
{
	
	speed = 0;
	hspeed = 2;
	
	var _new_x = _dest_x
	var _new_y = _dest_y 
		
    var _dir_to_player = point_direction(x, y, _new_x, _new_y);
    
    direction = _dir_to_player;
	image_angle = _dir_to_player; // Atualiza o ângulo da imagem
	
	} else {	
	speed = 0;
	hspeed = 0;
	
    var _new_x = _dest_x
	var _new_y = _dest_y 
    
	var _dir_to_player = point_direction(x, y, _new_x, _new_y);
    
	direction = _dir_to_player;
	image_angle = _dir_to_player; // Atualiza o ângulo da imagem

	} 
}
	
	
if (alarm[0] == -1) 
{ 
            var _miss = instance_create_layer(x + 35, y + 10, "Enemy_layer", O_enemy_slowbullet);

                _miss.speed = 4;
                _miss.direction = image_angle;
                _miss.image_angle = direction;
    
                var _random_pitch = random_range(0.8, 10);
                audio_sound_pitch(snd_missile_launcher, _random_pitch);
                audio_play_sound(snd_missile_launcher, 0, false);
    
                alarm[0] = 300;
}
 



