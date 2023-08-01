/// @description Inserir descrição aqui
// engine creation after select ship

script_execute(currentState);

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










