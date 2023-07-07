/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
menu_music = true;
if room == rm_Game
{
	audio_stop_sound(snd_menu);
	if  menu_music{
	audio_play_sound(snd__scriptel__tactic,0,true);
	menu_music = false;
	}
}


