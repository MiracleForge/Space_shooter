/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
//orbiting variable
//orbit_dir=0;
//orbit_distance = -1;
//orbit_speed = -1;
// Calculate the new position of the orbiting object in relation to center
//grav_center_x = ObuttonblackHole.x;
//grav_center_y = ObuttonblackHole.y;
//check = true;

// click planet
// growth size variable
planet_scale = undefined; // updates with internal variable of child / changes size
planet_id = -1; // identify the current planet clicked
open_gui = false;
planet_select = false;
scaling_completed = false;

// variables from panel 
mission1 = false; 
mission2 = false;
mission3 = false;
planet_description = true;

// Definir o array booleano para representar o desbloqueio dos planetas (false = bloqueado, true = desbloqueado)
planet_unlocked = undefined;
planet_opening = false;

// shaking planet
skake_initialized = false; // Variável booleana para controlar a atualização de prev_x e prev_y
prev_x = x;
prev_y = y;

 
_sprites = [spr_window_frame, spr_menu_organizer, spr_planet_panel, spr_text_box, sprite_index, spr_button_menu_panel, spr_button_menu_panel, spr_button_menu_panel,spr_button_menu_panel,spr_button_menu_panel]; // Sprites a serem desenhados
_x_positions = [1, 86, 0, 364.98, 546, 86, 86, 86.001,86,32]; // Posições horizontais dos sprites
_y_positions = [0.5, 172.49, 124.5, 640.49, 491, 560, 460, 355,671,1024]; // Posições verticais dos sprites
_xscales = [0.5679, 1, 1, 0.3356, 5, 0.8840, 0.8840, 0.8840,0.8840,2.2753]; // Escalas horizontais dos sprites
_yscales = [1.5541, 0.9962, 1, 1.47, 5.6666, 0.3640, 0.3640, 0.3640,0.3640,1.1825]; // Escalas verticais dos sprites





