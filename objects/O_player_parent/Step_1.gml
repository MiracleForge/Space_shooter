/// @description List of enemy toward player
//Você pode escrever seu código neste editor
if player_overheat_attack = scr_overheat_missile_default and overheat and is_undefined(global.possible_targets) || player_special_attack = scr_special_scoult and is_undefined(global.possible_targets) {
    global.possible_targets = ds_list_create();
    show_message("ds_create");
} 



















