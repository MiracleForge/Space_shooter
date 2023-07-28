/// @description Inserir descrição aqui
// engine creation after select ship

#region ship moviment
var _move_x = 0;
var _move_y = 0;

with(Ojoystick){	
	_move_x = joy_x/ radius;
	_move_y = joy_y/ radius;
	}
x += _move_x * move_speed;
y += _move_y * move_speed;

if _move_x != 0 or _move_y != 0{
direction = point_direction(0, 0, -Ojoystick.joy_x, -Ojoystick.joy_y);
image_angle = direction;

}

if keyboard_check(vk_up){	
	speed = -2;
	
    image_angle = direction;

	}else if keyboard_check(vk_down) {	
	speed = +2;
	}else {	
		speed = 0;
		}
	
if keyboard_check(vk_left){	
	direction += 3;
	}
if keyboard_check(vk_right){	
	direction -=3;
	}
move_wrap(true,false,0)
#endregion

//destroy ship
if life_ship <= 0 {	
	audio_play_sound(snd_Game_over_ship,0,false);
    effect_create_above(ef_firework, x,y,0.1,c_white);
	instance_destroy();
	instance_destroy(Oengine);
    instance_destroy(Oshield);
	Ogame.alarm[0] =	120;// restart game
	}
	

// shield broken 
if shield == 0 and alarm[3] == -1{	
	alarm[3] = 380;
	audio_play_sound(snd_shield_broken,0,false);
	
	}


#region overheat region
//overheat activation after >85
var _inst; // Declare _inst variable
var heat_countDown = 0
if heat >= 85 {
    overheat = true;
}

if heat >= maxHeat and alarm[0] == -1 and overheat or heat_countDown ==1 and !overheat{
    alarm[0] = 480;
	heat_countDown = 0;
}
#endregion










