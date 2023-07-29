/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();
if !active 
{
	return;
}
// Check if the space key is pressed and either the Shooting_button alarm is not active or shoot_on is true
if (keyboard_check_pressed(vk_space) && Shooting_button.alarm[0] == -1 || shoot_on)
{
    // Código específico da nave tipo 1 para gerar projéteis
    // Set the initial Y position for projectile instantiation
    var _offset = -10;
    // Increase the heat counter by 1 (assuming heat is a global variable)
    heat += 1;
    // Set the heat countdown to 1 (local variable on O_ship_parent)
    heat_countDown = 1;

    // Check if the spaceship is not overheated
    if (!overheat)
    {
        // Loop to create projectiles based on the ammo count
        for (var i = 0; i < ammo; i++)
        {
            // Create a projectile instance in the "Instances" layer with an offset in Y position
            var _inst = instance_create_layer(x - _offset, y - 1, "Instances", Omachinegun);
            // Set the speed, direction, and image angle of the projectile
            _inst.speed = -8;
            _inst.direction = direction;
            _inst.image_angle = direction;

            // Increase the Y offset for the next projectile
            _offset += 10;
		}
            // Generate a random pitch for the shooting sound effect
            var _random_pitch = random_range(0.8, 1.2);
            // Play the shooting sound effect with the random pitch
            audio_play_sound(snd_bullet01, 0, false);
            audio_sound_pitch(snd_bullet01, _random_pitch);

            // Set shoot_on to false, presumably to prevent rapid shooting
            shoot_on = false;
        
    }
    // If the spaceship is overheated
    else
    {
        // Set shoot_on to false, presumably to prevent shooting while overheated
        shoot_on = false;

        // Loop to create projectiles with a plus (ammo + 2) due to overheating
        for (var i = 0; i < ammo + 2; i++)
        {
            // Create a projectile instance in the "Instances" layer with an offset in Y position
            var _inst = instance_create_layer(x - _offset, y - 1, "Instances", Omachinegun);
            // Set the speed, direction, and image angle of the projectile
            _inst.speed = -8;
            _inst.direction = direction;
            _inst.image_angle = direction;

            // Set the color (image_blend) of the projectile to red to represent overheating
            _inst.image_blend = c_red;

            // Increase the Y offset for the next projectile
            _offset += 10;
		}
            // Generate a random pitch for the shooting sound effect
            var _random_pitch = random_range(0.8, 1.2);
            // Play the shooting sound effect with the random pitch
            audio_play_sound(snd_bullet01, 0, false);
            audio_sound_pitch(snd_bullet01, _random_pitch);
        
    }
}



