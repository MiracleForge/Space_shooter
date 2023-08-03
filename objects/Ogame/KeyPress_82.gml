/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
room_goto(rm_Game);
//player selector
pick_ship = true;
Pyframe_icon = 0;
trakying_ship = 1;
choose_ship = true;
ship_snd_select = false;
//music
Omusic_control.menu_music = true;
Omusic_control.room_alarmBoss = false;

// variables from lanets
O_parent_planets.mission = false;
O_parent_planets.planet_description = true;
 O_parent_planets.planet_unlocked = undefined;
O_parent_planets.planet_opening = false;
O_parent_planets.skake_initialized = false;
audio_stop_all();
score = 0;