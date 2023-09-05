/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
event_inherited();

max_movespeed = 4;
move_speed = max_movespeed;

heat = 0;
maxHeat = 110;
heat_capacity = 400;
time_to_cooling = 0.3;

max_shield = 20 + global.shield;
shield = max_shield;
shield_recover_max = 0.03

max_life = 4 + global.armor;
current_life = max_life;

shoot_on = false;

player_special_attack = scr_special_default;
player_normal_attack = scr_normal_missile_default;
player_overheat_attack = scr_overheat_missile_default;
player_shield_state = scr_shield_default;