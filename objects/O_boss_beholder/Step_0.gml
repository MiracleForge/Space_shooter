/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Dentro do evento Create do objeto
//destroying boss
if !instance_exists(Ofate) and movState != BOSSmov_state.intro 
and movState != BOSSmov_state.dying 
and movState != BOSSmov_state.phase_pre
{	
	var _inst = instance_create_layer(x, y, "Instances", Ofate);
	_inst.sprite_index = sprite_index;
	_inst.image_xscale = image_xscale;
	_inst.image_yscale = image_yscale;
}

#region /////////////// MOVIMENT STATES SWITCH //////////////////////////
switch(movState)
{
	case BOSSmov_state.intro:
		y = lerp(y,positionY,0.01);
	
		if (floor(abs(y - positionY)) == 0) // caso esteja na posição
		//mudar starte.
		{
			movState = BOSSmov_state.phase_one;
			position.next._x = x;
		}
	break;
	
	case BOSSmov_state.phase_one:
	    if (ceil(x) == ceil(position.next._x)) // Verifica se a posição atual é igual à próxima posição
	    {
	        // Escolha aleatória de uma nova posição x
	       position.next._x = irandom_range(96, room_width);
	
	    } 

	    x = lerp(x, position.next._x, 0.5);
	    image_angle = 5 * sign(x - position.next._x);
  
	
	    if (timers.shooting._current <= 0)
	    {
	        attkState = choose(BOOSshot_state.slow,BOOSshot_state.slowpar,BOOSshot_state.waiting);
	        timers.shooting._current = timers.shooting._max;
	    }
		    else
		    {
		        attkState = BOOSshot_state.waiting;
		        timers.shooting._current -= 1;
		    }
		if beholder_life <=0  
		{
			audio_play_sound(choose(snd_missile_explosion, snd__retro_bomb_explosion),Sounds.hits,false,0.3);
			movState = BOSSmov_state.phase_two;
			position.next._x = x;
			position.next._y = y;
			timers.shooting._max *= 0.75;
			beholder_life = max_beholder_life;
	
		}		  
	break;
	
	case BOSSmov_state.phase_two:
	   if (ceil(x) == ceil(position.next._x)) and (ceil(y) == ceil(position.next._y))// Verifica se a posição atual é igual à próxima posição
	    {
	        // Escolha aleatória de uma nova posição x
	        position.next._x = irandom_range(96, room_width);

	    } 
		
	    x = lerp(x, position.next._x, 0.5);
	
	    image_angle = 5 * sign(x - position.next._x);
  
			
			 if (timers.shooting._current <= 0)
		    {
		        attkState = choose( BOOSshot_state.rapidfire, BOOSshot_state.slow, BOOSshot_state.waiting);
		        timers.shooting._current = timers.shooting._max;
		    }
			    else
			    {
			        attkState = BOOSshot_state.waiting;
			        timers.shooting._current -= 1;
			    }
			
		if beholder_life <=0
		{
			audio_play_sound(choose(snd_missile_explosion, snd__retro_bomb_explosion),Sounds.hits,false,0.3);
			movState = BOSSmov_state.phase_three;
			position.next._x = room_width/2;
			position.next._y = positionY;
			timers.shooting._max *= 0.75;
			beholder_life = max_beholder_life;
		}	
	break;

	case BOSSmov_state.phase_three:
		 if (ceil(x) == ceil(position.next._x))// Verifica se a posição atual é igual à próxima posição
	    {
	        // Escolha aleatória de uma nova posição x
	        position.next._x = irandom_range(96, room_width);
			
	    }
	   
	    x = lerp(x, position.next._x, 0.5);
		y = lerp(y, position.next._y, 0.5);
		image_angle = 5 * sign(x - position.next._x);
	  
		 if (timers.shooting._current <= 0)
		    {
		        attkState = choose( BOOSshot_state.circle, BOOSshot_state.waiting);
		        timers.shooting._current = timers.shooting._max;
		    }
			    else
			    {
			        attkState = BOOSshot_state.waiting;
			        timers.shooting._current -= 1;
			    }
		 	if beholder_life <=0
		{
			audio_play_sound(snd_horn_sound,Sounds.lazer,true);
			audio_play_sound(choose(snd_missile_explosion, snd__retro_bomb_explosion),Sounds.hits,false,0.3);
			movState = BOSSmov_state.phase_pre;
			position.next._x = x;
			position.next._y = y;
			timers.shooting._max *= 0.75;
			beholder_life = max_beholder_life;
		}
	break;
	
	case BOSSmov_state.phase_pre:
		x = lerp(x,room_width/2,0.01);
		y = lerp(y,positionY,0.01);
		image_angle = 360;
		
	
		if (floor(abs(y - positionY)) == 0) and (floor(abs(x - room_width/2)) == 0)and !alarm2set // caso esteja na posição
		//mudar starte.
		{	
			alarm[2] = 60;
			alarm2set = true
		
		}
		
			  attkState = BOOSshot_state.waiting;
			  timers.shooting._current -= 1;
			   
	break;
	
	case BOSSmov_state.mov_aleatory:
		    if (ceil(x) == ceil(position.next._x) and ceil(y) == ceil(position.next._y)) // Verifica se a posição atual é igual à próxima posição
	    {
	        // Escolha aleatória de uma nova posição x
	       position.next._x = irandom_range(96, room_width);
		   position.next._y = irandom_range(100, 500);
	
	    } 

	    x = lerp(x, position.next._x, 0.5);
	    y = lerp(y, position.next._y, 0.5);
	    image_angle = 5 * sign(x - position.next._x);
		
		if (timers.shooting._current <= 0)
		    {
		        attkState = choose( BOOSshot_state.aleatory, BOOSshot_state.waiting);
		        timers.shooting._current = timers.shooting._max;
		    }
			    else
			    {
			        attkState = BOOSshot_state.waiting;
			        timers.shooting._current -= 1;
			    }
		 	if beholder_life <=0
		{
		movState = BOSSmov_state.dying;
		
			
		}
	break;
	case BOSSmov_state.dying:
		
		x = x;
		y = y;
		var area_randomX = x + random(sprite_width);
		var area_randomY = y + random(sprite_height);
		attkState = BOOSshot_state.waiting;
		if alarm[3] == -1 {
			with(Ogame){
			  shake = true;
		      shake_time = 30;
		      shake_magnitude = 5;
		      shake_fade = 0.2;
			}
				
			alarm[3] = 60;
		}
			for (var ex = 0; ex < 10; ex++)   {
			    // code here
		
			    var randomOffsetX = irandom_range(-32, 32); // Ajuste o valor conforme necessário para a distribuição desejada
			    var randomOffsetY = irandom_range(-32, 32); // Ajuste o valor conforme necessário para a distribuição desejada

			    var spawnX = area_randomX + randomOffsetX;
			    var spawnY = area_randomY + randomOffsetY;

			    instance_create_layer(spawnX, spawnY, "Enemy_layer", O_eff_bombs);
			}
		
		
	break;
}
#endregion


#region /// switch states attaks
switch(attkState)
{
	case BOOSshot_state.waiting:
	//do nothing
	break;
	
	case BOOSshot_state.slow:

	var _inst = instance_create_layer(x,y,"instances", ObossBullet);
	if instance_exists(O_ship_parent)
	{
		_inst.direction = point_direction(x,y,O_ship_parent.x, O_ship_parent.y);	
	}
	audio_play_sound(snd_bullet01,Sounds.lazer,false);
	break;

	case BOOSshot_state.slowpar:

		var _inst_a = instance_create_layer(x + 50,y,"instances", ObossBullet);
		var _inst_b = instance_create_layer(x - 50,y,"instances", ObossBullet);
		if instance_exists(O_ship_parent)
		{
			_inst_a.direction = point_direction(x,y,O_ship_parent.x, O_ship_parent.y);	
			_inst_b.direction = point_direction(x,y,O_ship_parent.x, O_ship_parent.y);	
		}
		audio_play_sound(snd_bullet01,Sounds.lazer,false);
		break;
		
		case BOOSshot_state.aleatory:
			if !instance_exists(ObossShield)
			{
				instance_create_layer(x,y,"layer_under", ObossShield);
			}
			if alarm[0] == -1
			{
				alarm[0] = 30;	
			}
		break;
		case BOOSshot_state.rapidfire:
		for (var i = 0; i < 4; ++i) {
		   	var _inst = instance_create_layer(x,y,"instances", ObossBullet);
			_inst.timer_wait = i *8;
			if instance_exists(O_ship_parent)
			{
				_inst.direction = point_direction(x,y,O_ship_parent.x, O_ship_parent.y);	
			}
		audio_play_sound(snd_bullet01,Sounds.lazer,false);
		}		
		break;
		
		case BOOSshot_state.circle:
		var _inst = noone;
		for (var i = 180; i <360; i += 15) {
		    var _xx = x + lengthdir_x(32,i);
			var _yy = y + lengthdir_y(21,i);
			
			 _inst = instance_create_layer(_xx,_yy,"instances", ObossBulletslow);
			_inst.direction = i;
		}	
		audio_play_sound(snd_bullet01,Sounds.lazer,false);
		break;
}
#endregion