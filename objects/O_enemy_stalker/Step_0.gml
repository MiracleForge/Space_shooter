/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

event_inherited()

#macro INTROPOS_Y 100 // FIRST POSITION
#macro MIN_NEARIST_PROJECTILE 80 // POSITION OF PLAYERS PROJECTIEL
#macro DIST_MIN_TO_ENGAGE 200 // DIST TO MEDIUM RANGE ATTK
#macro DIST_MIN_TO_DASH 50 // DISTANCE CLOSE TO PLAYER 
#macro DIRECTION_TO_DODGE choose(300,-300)
// TIMERS
#macro TIME_TO_DODGE 60 // COUNDOWN TO ALLOW ENEMY TO DODGE
#macro TIME_TO_LEAVE 600 // COUNTDOWN TO LEAVE ROOM
#macro TIME_TO_DASH 120 // TIME TO DASH IN TO PLAYER AGAIN

var _ship = O_player_parent;
if instance_exists(_ship) {

var _dest_x = _ship.x;
var _dest_y = _ship.y;

	
var _dist_to_target = distance_to_object(_ship);
var _dir_to_player = point_direction(x, y, _dest_x, _dest_y);

switch(movState)
{
	
	case enemy_mov.intro:
		y = lerp(y,INTROPOS_Y,0.04);// Move vertically towards the intro position
	
		if (floor(abs(y - INTROPOS_Y)) == 0) // caso esteja na posição
		//mudar starte.
		{
			
			movState = enemy_mov.distance; // Transition to distance state
            

		}
	break;
	// estado onde o inimigo se aproxima do player, atirando munições a distância
	case enemy_mov.distance:
	var nearestProjectile = instance_nearest(x, y, O_parent_projetil);// Find nearest projectile

	if (nearestProjectile != noone) and alarm[0] <= -1 { // If there's a projetil close and clowdown time to dogge is on , can doggle
	    var distanceToProjectile = point_distance(x, y, nearestProjectile.x, nearestProjectile.y);
	
	    if (distanceToProjectile <= MIN_NEARIST_PROJECTILE) {// Check if distance is within dodge range
			alarm[0] = TIME_TO_DODGE; // CountDown to doggle
	        position.next._x = x + DIRECTION_TO_DODGE;
	        movState = enemy_mov.retreate;// Transition to retreat state
	    }
	}

    // Update position and direction based on target distance
    if (_dist_to_target >= DIST_MIN_TO_ENGAGE) {
        speed = 0;
        hspeed = 2;
        direction = _dir_to_player;
        image_angle = _dir_to_player; // update image angle
	
    } else {
        movState = enemy_mov.medium_range; // Transition to medium range state
		alarm[0] = TIME_TO_LEAVE; // AT this point timer is set to leave room
    }
	
    // Attack state management
    if (timers.shooting._current <= 0) { // se o timer is below zero , can shoot
        attkState = choose(enemy_attk.spread);
        timers.shooting._current = timers.shooting._max;
    } else {
        attkState = enemy_attk.waiting;
        timers.shooting._current -= 0.5;
    }
	break;
	case enemy_mov.medium_range:
		
			speed = 0;
			vspeed = 0;
			
			direction = _dir_to_player;
			image_angle = _dir_to_player; // Atualiza o ângulo da imagem
			
			// Atualização do estado de ataque
			 if (timers.shooting._current <= 0) { // se o timer for menor que zero, a nave pode disparar
			     attkState = choose(enemy_attk.slow);
			     timers.shooting._current = timers.shooting._max;
				} else {
				 attkState = enemy_attk.waiting;
				 timers.shooting._current -= 0.5;
			    }	
			if _dist_to_target < DIST_MIN_TO_DASH {

				var _stateshield = instance_create_layer(x,y,"Enemy_layer",Oshield_enemy);
					_stateshield.target = id;
			   // Adjust the destination point to make the dash longer
			   	attkState = enemy_attk.waiting;
				position.next._x = _ship.x;
			    position.next._y = _ship.y;
			    movState = enemy_mov.dash;
			}
			if alarm[0] <= -1 {
				movState = enemy_mov.leaving;	
			}
	break;
	case enemy_mov.dash:
			attkState = enemy_attk.waiting;
			var shake_amount = irandom_range(-6,6);
			
		    image_angle = _dir_to_player + shake_amount
		    if (instance_exists(Oshield_enemy)) {
			    if (Oshield_enemy.target == id) {
			        if (Oshield_enemy.image_alpha >= 1) {
			    
						var color = 355;
						color --;
						image_alpha -= 0.1
						    var _inst = instance_create_layer(x, y, "Instances", Ofate);
								_inst.sprite_index = sprite_index;
								_inst.image_xscale = image_xscale;
								_inst.image_yscale = image_yscale;
								_inst.image_angle = image_angle;
								_inst.image_blend = color ;

						  x = lerp(x, position.next._x, 0.2);
						  y = lerp(y, position.next._y, 0.2);
						  if (ceil(x) == ceil(position.next._x)) and (ceil(y) == ceil(position.next._y))// Verifica se a posição atual é igual à próxima posição
							 {
								 audio_play_sound(snd_dash,1,false);
								image_alpha = 1;
								 movState = enemy_mov.leaving;
								instance_destroy(Oshield_enemy);
								alarm[0] = TIME_TO_DASH;
							 }
						}
				}
		}
	break;
	case enemy_mov.leaving:
	    image_angle = _dir_to_player;
	    vspeed = 1.5;
   
	    if (_dist_to_target >= DIST_MIN_TO_DASH) {
	        if (timers.shooting._current <= 0) {
	            // Choose attack state based on distance
	            if (_dist_to_target >= DIST_MIN_TO_ENGAGE) {
	                attkState = choose(enemy_attk.spread);
	                timers.shooting._current = timers.shooting._max;
	            } else {
	                attkState = choose(enemy_attk.slow);
	                timers.shooting._current = timers.shooting._max;
	            }
	        } else {
	            attkState = enemy_attk.waiting;
	            timers.shooting._current -= (_dist_to_target >= DIST_MIN_TO_ENGAGE) ? 0.5 : 0.5;
	        }
	    } else { // if is in the distance correct and countdown allowed , then dash
	        if (alarm[0] <= 0) {
				var _stateshield = instance_create_layer(x,y,"Enemy_layer",Oshield_enemy);
					_stateshield.target = id;
				vspeed = 0;
				position.next._x = _ship.x;
			    position.next._y = _ship.y;
	            movState = enemy_mov.dash;
	        }
	    }
	    break;
		case enemy_mov.retreate:
		 attkState = enemy_attk.waiting;
		 	var color = 355;
			color --;
			image_alpha -= 0.1
			    var _inst = instance_create_layer(x, y, "Instances", Ofate);
					_inst.sprite_index = sprite_index;
					_inst.image_xscale = image_xscale;
					_inst.image_yscale = image_yscale;
					_inst.image_angle = image_angle;
					_inst.image_blend = color ;
		 x = lerp(x, position.next._x, 0.2);
	     y = lerp(y, position.next._y, 0.2);
		 movState = enemy_mov.distance;
				 
	break;

}


switch(attkState)
{
	case enemy_attk.waiting:
		// do nothing;
	break;
	case enemy_attk.spread:
		 var _numProjectiles = 3; // Número total de projéteis
		 var _angleOffset = 15;   // Ângulo de desvio em graus

			for (var i = 0; i < _numProjectiles; i++)
			    {
					var _centralMissile = instance_create_layer(x, y, "Enemy_layer", O_enemy_slowbullet);
			        var _angle = image_angle + _angleOffset * (i - 1); // Calcula o ângulo para cada projétil
			        _centralMissile.speed = 5;
			        _centralMissile.direction = _angle;
			        _centralMissile.image_angle = _angle;
				}	
	break;
	case enemy_attk.slow: 
		
		var _inst = instance_create_layer(x,y, "Enemy_layer", O_enemy_slowbullet);
		_inst.direction = _dir_to_player;
		_inst.image_angle = _dir_to_player;
		_inst.hspeed = lengthdir_x(2,_dir_to_player);
		_inst.vspeed = lengthdir_y(2,_dir_to_player);
		_inst.chasing = true;
		
	break;
}
}









