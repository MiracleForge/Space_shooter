/// @description Overheat and cooling system

// reset overheat variables
if overheat
{
heat = 0; //  cooling heat
overheat = false; //  overheat state off
	if player_overheat_attack = scr_overheat_missile_default || player_special_attack = scr_special_scoult{ // if player is shooting missiles, need to destroy enemy list
		ds_list_destroy(global.possible_targets);
		global.possible_targets = undefined; 
	}
}

// on overheat == false , this alarm on works like a timer














