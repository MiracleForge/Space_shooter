/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
menu_music = true;

if (menu_music) {
    if room == rm_Menu
	{
		return;	
	}
    audio_stop_all();
    switch (room) {
        case rm_Game:
		
            audio_play_sound(snd__scriptel__tactic, 0, true);
            break;
        case rm_Hightspeed:
		
            audio_play_sound(snd_space_amb, 0, true);
            break;
        case rm_Mapa:
		
            audio_play_sound(snd_galaxy_ambient, 0, true);
            break;
        default:
            break;
    }
    
    menu_music = false;
}

