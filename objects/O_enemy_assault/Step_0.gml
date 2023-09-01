/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Inherit the parent event
// Calling the inherited event
event_inherited();

// Constants
#macro ASSAULT_DIST_TO_PLAYER 30
#macro NUMBER_OF_MINES 10
#macro MINES_SPREAD choose(10, 20, 30, 40, 50)

// Get reference to the parent ship
var _ship = O_ship_parent;

// If ship instance doesn't exist, return
if (!instance_exists(_ship)) 
{	
    return;	
}

// Calculate direction to the player ship
var dest_x = _ship.x;
var dest_y = _ship.y;	
var dir_to_player = point_direction(x, y, dest_x, dest_y);

// State machine for enemy behavior
switch (movState)
{
    case enemy_mov.intro:
        // Set rotation angle and direction
        image_angle = dir_to_player;
        direction = image_angle;
        
        // Move the enemy based on the set direction
        if (enemy_direction == false) {
            speed = 1.8;
            hspeed = 2.4;
        } else {	
            speed = 1.8;
            hspeed = -2.4;
        }

        // Calculate new position
        var new_x = x + lengthdir_x(speed, image_angle);
        var new_y = y + lengthdir_y(speed, -image_angle);
        
        // Update position
        x = new_x;
        y = new_y;

        // Attack state management
        if (instance_number(O_enemy_mine) <= NUMBER_OF_MINES) {
            attkState = choose(enemy_attk.especial);
            timers.shooting._current = timers.shooting._max;
        } else {
            attkState = enemy_attk.waiting;
            timers.shooting._current -= 0.1;
        }
        
    break;
    
    case enemy_mov.dying:
        // Visual effects and audio
        effect_create_above(ef_ellipse, x, y, 4, c_orange);
        effect_create_above(ef_flare, x, y, 1, c_orange);
        audio_play_sound(snd_impact, 1, false, 0.4);
        instance_destroy();
    break;
}

// Attack behavior based on the attack state
switch (attkState)
{
    case enemy_attk.waiting:
        // Do nothing
    break;
    
    case enemy_attk.especial:
        if (instance_number(O_enemy_mine) <= NUMBER_OF_MINES) {
            // Create a mine instance with specific properties
            var _miss = instance_create_layer(x + MINES_SPREAD, y + MINES_SPREAD, "Enemy_layer", O_enemy_mine);
            _miss.speed = random_range(6, 9);
            _miss.direction = image_angle;
            _miss.image_angle = direction;

            // Audio effect with random pitch
            var _random_pitch = random_range(0.8, 10);
            audio_sound_pitch(snd_missile_launcher, _random_pitch);
            audio_play_sound(snd_missile_launcher, 0, false);
        } else {
            attkState = enemy_attk.waiting;
        }
    break;	
}




   


