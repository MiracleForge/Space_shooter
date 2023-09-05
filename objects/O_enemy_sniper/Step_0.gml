/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();
// Define macros for constant values
#macro TARGET_ALPHA 1
#macro ALPHA_SPEED 0.01
#macro CHARGE_ALARM_DURATION 150
#macro SHOOT_ALARM_DURATION 160
#macro MIN_TARGET_ALPHA 0.3

// Inherit the parent event
event_inherited();

// Define a flag to indicate if the enemy is charged and ready to fire
var charged = false;

if (!instance_exists(O_player_parent)) {
    return;
}
if movState == enemy_mov.leaving
{
	x = lerp(x, position.next._x, 0.01);
    y = lerp(y, position.next._y, 0.01);
    vspeed = 2;
	image_angle = 270;
}
if alarm[1] <=0 
{
	 if (image_alpha >= MIN_TARGET_ALPHA) {
        image_alpha -= ALPHA_SPEED;
          if (image_alpha <= MIN_TARGET_ALPHA ) {
    
              	movState = enemy_mov.leaving;	
				position.next._x = irandom_range(0, room_width);
			    position.next._y = room_height + 30;
           }
       }

}
var _ship = O_player_parent;
var _dir_to_target = point_direction(x, y, _ship.x, _ship.y);
image_angle = _dir_to_target;

switch (movState) {

    case SNIPER.WALK:

        attkState = enemy_attk.waiting;
        x = lerp(x, position.next._x, 0.01);
        y = lerp(y, position.next._y, 0.01);
        if (alarm[0] == -1) {

            movState = SNIPER.CHARGING;
            alarm[0] = CHARGE_ALARM_DURATION;
            charged = false; // Reset the charged flag when entering CHARGING state
        }
        break;
    case SNIPER.CHARGING:
 
        if (image_alpha < TARGET_ALPHA) {
            image_alpha += ALPHA_SPEED;
        } else {
            image_alpha = TARGET_ALPHA;
            if (alarm[0] == -1 && !charged) { // Check if not already charged
                charged = true; // Set the charged flag
				attkState = enemy_attk.especial;
				movState = enemy_mov.intro;
            }
        }
        break;
    case SNIPER.STEALTH:
        if (image_alpha >= MIN_TARGET_ALPHA) {
            image_alpha -= ALPHA_SPEED;
            if (image_alpha <= MIN_TARGET_ALPHA ) {
    
                movState = SNIPER.WALK;
            }
        }
        break;
}

switch (attkState) {
    case enemy_attk.especial:
        if (charged && instance_exists(_ship) && !instance_exists(O_enemy_lazer)) {
			
            instance_create_layer(_ship.x, _ship.y, "Enemy_layer", O_enemy_lazer);
            charged = false; // Reset the charged flag
            alarm[0] = SHOOT_ALARM_DURATION;
            var _room_posX = room_width - 30;
            position.next._x = irandom_range(96, _room_posX);
            position.next._y = irandom_range(96, room_height);
		
     
        }
        break;

}





