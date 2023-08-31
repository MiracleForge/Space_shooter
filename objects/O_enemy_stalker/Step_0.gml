/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if hitpoints._current <=0{
	movState = stalker_mov.dying
	}

if instance_exists(O_ship_parent) {
var _ship = O_ship_parent;
var _dist = 200;
var _dest_x = _ship.x;
var _dest_y = _ship.y;

	
var _dist_to_target = distance_to_object(_ship);
var _dir_to_player = point_direction(x, y, _dest_x, _dest_y);

switch(movState)
{
	
	case stalker_mov.intro:
		y = lerp(y,positionY,0.04);
	
		if (floor(abs(y - positionY)) == 0) // caso esteja na posição
		//mudar starte.
		{
			movState = stalker_mov.distance;
			
			//position.next._x = x;
		}
	break;
	// estado onde o inimigo se aproxima do player, atirando munições a distância
	case stalker_mov.distance:
	var nearestProjectile = instance_nearest(x, y, O_parent_projetil);

	if (nearestProjectile != noone) and alarm[0] <= -1 {
	    var distanceToProjectile = point_distance(x, y, nearestProjectile.x, nearestProjectile.y);
	
	    if (distanceToProjectile <= 80) {
			alarm[0] = 60;
			var Detour_dir = choose(300,-300);
	        position.next._x = x + Detour_dir;
	        //position.next._y = y + Detour_dir;
	        movState = stalker_mov.retreate;
	    }
	}

    // Atualização de posição e direção
    if (_dist_to_target >= _dist) {
        speed = 0;
        hspeed = 2;
        direction = _dir_to_player;
        image_angle = _dir_to_player; // Atualiza o ângulo da imagem
	
    } else {
        movState = stalker_mov.medium_range; // a nave se aproxima muito do player mudando de estado
		alarm[0] = 600;
    }
	
    // Atualização do estado de ataque
    if (timers.shooting._current <= 0) { // se o timer for menor que zero, a nave pode disparar
        attkState = choose(stalker_attk.spread);
        timers.shooting._current = timers.shooting._max;
    } else {
        attkState = stalker_attk.waiting;
        timers.shooting._current -= 0.5;
    }
	break;
	case stalker_mov.medium_range:
		
			speed = 0;
			vspeed = 0;
			
			direction = _dir_to_player;
			image_angle = _dir_to_player; // Atualiza o ângulo da imagem
			
			// Atualização do estado de ataque
			 if (timers.shooting._current <= 0) { // se o timer for menor que zero, a nave pode disparar
			     attkState = choose(stalker_attk.slow);
			     timers.shooting._current = timers.shooting._max;
				} else {
				 attkState = stalker_attk.waiting;
				 timers.shooting._current -= 0.5;
			    }	
			if _dist_to_target < 100 {

				var _stateshield = instance_create_layer(x,y,"Enemy_layer",Oshield_enemy); 
			   // Adjust the destination point to make the dash longer
			   	attkState = stalker_attk.waiting;
				position.next._x = O_ship_parent.x;
			    position.next._y = O_ship_parent.y;
			    movState = stalker_mov.dash;
			}
			if alarm[0] <= -1 {
				movState = stalker_mov.leaving;	
			}
	break;
	case stalker_mov.dash:
			attkState = stalker_attk.waiting;
			var shake_amount = irandom_range(-6,6);
			
		    image_angle = _dir_to_player + shake_amount
		    if Oshield_enemy.image_alpha >= 1{
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
					 movState = stalker_mov.leaving;
					instance_destroy(Oshield_enemy);
					alarm[0] = 120;
				 }
			}
	break;
	case stalker_mov.leaving:
	    image_angle = _dir_to_player;
	    vspeed = 1.5;
   
	    if (_dist_to_target >= 50) {
	        if (timers.shooting._current <= 0) {
	            // Choose attack state based on distance
	            if (_dist_to_target >= 200) {
	                attkState = choose(stalker_attk.spread);
	                timers.shooting._current = timers.shooting._max;
	            } else {
	                attkState = choose(stalker_attk.slow);
	                timers.shooting._current = timers.shooting._max;
	            }
	        } else {
	            attkState = stalker_attk.waiting;
	            timers.shooting._current -= (_dist_to_target >= 200) ? 0.5 : 0.5;
	        }
	    } else {
	        if (alarm[0] <= 0) {
				var _stateshield = instance_create_layer(x,y,"Enemy_layer",Oshield_enemy); 
				vspeed = 0;
				position.next._x = O_ship_parent.x;
			    position.next._y = O_ship_parent.y;
	            movState = stalker_mov.dash;
	        }
	    }
	    break;
		case stalker_mov.dying:
			effect_create_above(ef_ellipse,x,y,4,c_orange);
			effect_create_above(ef_flare,x,y,1,c_orange);
			audio_play_sound(snd_impact,1,false, 0.4);
			instance_destroy();
		break;
		case stalker_mov.retreate:
		 attkState = stalker_attk.waiting;
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
		 movState = stalker_mov.distance;
				 
	break;

}


switch(attkState)
{
	case stalker_attk.waiting:
		// do nothing;
	break;
	case stalker_attk.spread:
		 var _numProjectiles = 3; // Número total de projéteis
		 var _angleOffset = 15;   // Ângulo de desvio em graus

			for (var i = 0; i < _numProjectiles; i++)
			    {
					var _centralMissile = instance_create_layer(x, y, "Enemy_layer", O_enemy_slowbullet);
			        var _angle = image_angle + _angleOffset * (i - 1); // Calcula o ângulo para cada projétil
			        _centralMissile.speed = 7;
			        _centralMissile.direction = _angle;
			        _centralMissile.image_angle = _angle;
				}	
	break;
	case stalker_attk.slow: 
		
		var _inst = instance_create_layer(x,y, "Enemy_layer", O_enemy_slowbullet);
		_inst.direction = _dir_to_player;
		_inst.image_angle = _dir_to_player;
		_inst.hspeed = lengthdir_x(2,_dir_to_player);
		_inst.vspeed = lengthdir_y(2,_dir_to_player);
		_inst.chasing = true;
		
	break;
}
}









