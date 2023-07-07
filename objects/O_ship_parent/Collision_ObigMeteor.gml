/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
screenshake(30, 10, 0.2);
audio_play_sound(snd_Game_over_ship,0,false);
effect_create_above(ef_firework, x,y,0.1,c_white);
instance_destroy();
instance_destroy(Oengine);
Ogame.alarm[0] =	120;