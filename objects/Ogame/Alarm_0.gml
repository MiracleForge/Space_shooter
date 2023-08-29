/// @description RESTART GAME
// Você pode escrever seu código neste editor
room_restart();
instance_destroy(O_timer);
pick_ship = true;
Omusic_control.menu_music = true;
Omusic_control.room_alarmBoss = false;
audio_stop_all();
score = 0;
//scr_selection_save_system();


