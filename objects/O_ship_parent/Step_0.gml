/// @description Inserir descrição aqui
// engine creation after select ship
// player ship destroi
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

var _inst; // Declare _inst variable
var heat_countDown = 0

if (keyboard_check_pressed(vk_space) && Shooting_button.alarm[0] == -1 || shoot_on)
{
    var _instY = -10;
    heat += 1;
    heat_countDown = 1
    if (!overheat)
    {
        for (var i = 0; i < ammo; i++)
        {
            _inst = instance_create_layer(x - _instY, y - 1, "Instances", Omachinegun);
            _inst.speed = -6;
            _inst.direction = direction;
            _inst.image_angle = direction;

            _instY += 10;

            var randomPitch = random_range(0.8, 1.2);
            audio_play_sound(snd_bullet01, 0, false);
            audio_sound_pitch(snd_bullet01, randomPitch);
            shoot_on = false;
        }

        if (current_ship == 2 && alarm[1] == -1)
        {
            var _miss = instance_create_layer(x - _instY, y - 1 - _instY, "Instances", O_missile);
            _miss.speed = -2;
            _miss.direction = direction;
            _miss.image_angle = direction;
            alarm[1] = 120;
            var randomPitch = random_range(0.8, 10);
            audio_sound_pitch(snd_missile_launcher, randomPitch);
            audio_play_sound(snd_missile_launcher, 0, false);
        }
    }
    else
    {
        shoot_on = false;
        if (current_ship == 1 )
        {
            for (var i = 0; i < ammo + 2; i++)
            {
                _inst = instance_create_layer(x - _instY, y - 1, "Instances", Omachinegun);
                _inst.speed = -8;
                _inst.direction = direction;
                _inst.image_angle = direction;
                _inst.image_blend = c_red;
                _instY += 10;

                var randomPitch = random_range(0.8, 1.2);
                audio_play_sound(snd_bullet01, 0, false);
                audio_sound_pitch(snd_bullet01, randomPitch);
            }
        }
        else
        {
			  for (var i = 0; i < ammo; i++)
        {
            _inst = instance_create_layer(x - _instY, y - 1, "Instances", Omachinegun);
            _inst.speed = -6;
            _inst.direction = direction;
            _inst.image_angle = direction;

            _instY += 10;

            var randomPitch = random_range(0.8, 1.2);
            audio_play_sound(snd_bullet01, 0, false);
            audio_sound_pitch(snd_bullet01, randomPitch);
            shoot_on = false;
        }
            _inst = instance_create_layer(x - _instY, y - 1, "Instances", O_missile);
            _inst.speed = -8;
            _inst.direction = direction;
            _inst.image_angle = direction;
            _inst.image_blend = c_red;
            alarm[1] = 30;
            var randomPitch = random_range(0.8, 10);
            audio_sound_pitch(snd_missile_launcher, randomPitch);
            audio_play_sound(snd_missile_launcher, 0, false);
        }
    }
}

if mouse_check_button_pressed(mb_left){	
	//scr_create_light(mouse_x,mouse_y,make_color_hsv(random(255),255,255),1,1,1);
	
	}

if heat >= 85 {
    overheat = true;
}

if heat >= maxHeat and alarm[0] == -1 and overheat or heat_countDown ==1 and !overheat{
    alarm[0] = 480;
	heat_countDown = 0;
}









