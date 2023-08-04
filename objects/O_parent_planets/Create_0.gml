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
global.open_gui = false;
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

 






