/// @description hit
// Você pode escrever seu código neste editor

//reactivate damage
take_damage = true;

 
 
 
 
/*
	function scr_character_hit() {	
    if (alarm[2] > 0) {	
		
        hveloc = lengthdir_x(3, push_dir);
        vveloc = lengthdir_y(3, push_dir);
		
        scr_collision_character();
		
	}else {
			audio_play_sound(snd_hit_license_Lemonjolly,  1 , 0)
			if shield_up {
				state =scr_shield_posture;
				}else{
		    state = scr_personagem_andando;
				}
    }
}