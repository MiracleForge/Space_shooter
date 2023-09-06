 /// @description Inserir descrição aqui
// Você pode escrever seu código neste edit
 
#region // Default Character Configuration
// Image Scale
image_xscale = 3.6;
image_yscale = 3.6;

// Player Health Points (Life)
max_life = 10 + global.armor;
current_life = max_life;

// Movement Speed
move_speed = 3 + global.speedo;
max_movespeed = move_speed;

// Heat Capacity
heat  =0;
max_heat = 120 + global.heat;
overheat = false;
heat_capacity = 600; // total capacity of keep shooting at heat shooting
time_to_cooling = 0.6;
// Ammunition Capacity
ammo = 2;

// Shield Capacity
max_shield = 15 + global.shield;
shield = max_shield;
shield_recover_max = 0.03; // total time to reach full shield after broken

// Damage Control
damage_alpha = -1; // Controls transparency
allow_damage = true; // Allows the ship to be hit only once at a time
shield_active = true; // Controls if the shield is active or deactivated

// Shooting Control
shoot_enabled = false;

// Dialog System
dialog_enabled = false;
#endregion

#region // Default Character Configuration
// Player Movement State
player_movement_state = undefined;

// Normal Attack State
player_normal_attack = undefined;

// Overheat Attack State
player_overheat_attack = undefined;

// Special Attack State
player_special_attack = undefined;

// Shield state
player_shield_state = undefined;
#endregion

instance_create_layer(x,y,"layer_under", Oengine);

global.possible_targets = undefined;





