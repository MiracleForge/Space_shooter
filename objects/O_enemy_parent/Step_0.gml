/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _ship = O_ship_parent;


if life <= 0
{	
	instance_destroy();
	score +=1;
}

if (alarm[0] == -1) {
		if enemy_type == 1  {
	    var _miss = instance_create_layer(x + 35, y +10, "Instances", O_enemy_machine_gun);
        if enemy_direction
		{ _miss.speed = -6 
		}else{	
	    _miss.speed = 6;
		}
	    _miss.direction = direction;
	    _miss.image_angle = direction;

	    var randomPitch = random_range(0.8, 10);
	    audio_sound_pitch(snd_missile_launcher, randomPitch);
	    audio_play_sound(snd_missile_launcher, 0, false);
    
	    alarm[0] = 280;
	}else if enemy_type == 2{	
			
				 var _miss = instance_create_layer(x + 35, y +10, "Instances", O_enemy_machine_gun);
    
			    _miss.speed = 6;
			    _miss.direction = image_angle;
			    _miss.image_angle = direction;

			    var randomPitch = random_range(0.8, 10);
			    audio_sound_pitch(snd_missile_launcher, randomPitch);
			    audio_play_sound(snd_missile_launcher, 0, false);
    
			    alarm[0] = 280;
		
			
	} if enemy_type == 3 {
		if instance_exists(_ship)
		{
	     instance_create_layer(_ship.x, _ship.y, "Instances", O_enemy_lazer);
		       
	    alarm[0] = 480;
		}

		}

}



if instance_exists(_ship){
    var dist = 30; // Distância desejada do jogador
	var dest_x = _ship.x;
	var dest_y = _ship.y;
	
	if (enemy_type == 2) {
		if distance_to_object(_ship) >= dist 
		{
	
		speed = 0;
		hspeed = 2;
	
	    var new_x = dest_x
	    var new_y = dest_y 
    
	    var dir_to_player = point_direction(x, y, new_x, new_y);
    
	    direction = dir_to_player;
	    image_angle = dir_to_player; // Atualiza o ângulo da imagem
	
		} else {	
		speed = 0;
		hspeed = 0;
	
	    var new_x = dest_x
	    var new_y = dest_y 
    
	    var dir_to_player = point_direction(x, y, new_x, new_y);
    
	    direction = dir_to_player;
	    image_angle = dir_to_player; // Atualiza o ângulo da imagem
		

	} 
	
		if enemy_type == 1{
		    direction = image_angle;
		    speed = 4;
    
		    var new_x = x + lengthdir_x(speed, direction);
		    var new_y = y + lengthdir_y(speed, direction);
		    // Define a nova posição sem colidir com O_ship_parent
		        x = new_x;
		        y = new_y;
		}

	}
if enemy_type == 3 
	{

if (x <= 100) {
    direction = 1; // Muda a direção para a direita
} else if (x >= 700) {
    direction = -1; // Muda a direção para a esquerda
}
if direction == 1{	
	hspeed = 1
	}else {	
		hspeed = -1;
		}
	
		var dir_to_player = point_direction(x, y, dest_x, dest_y);
		image_angle = dir_to_player;
		
		
		
	}

}
