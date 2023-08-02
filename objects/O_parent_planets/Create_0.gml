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

// variables from panel 
mission = false;
planet_description = true;

// Definir o array booleano para representar o desbloqueio dos planetas (false = bloqueado, true = desbloqueado)
 planet_unlocked = undefined;

// Suponha que você tenha um array de arrays para verificar se as missões de cada planeta foram concluídas (true = concluída, false = não concluída)
 missions_completed = [
    [true, true, true], // Planeta 1: Todas as missões foram concluídas
    [false, false, false], // Planeta 2: Nenhuma missão foi concluída
    [false, false, false], // Planeta 3: A missão 2 foi concluída
    [false, true, false], // Planeta 4: As missões 1 e 2 foram concluídas
    [false, false, false] // Planeta 5: Todas as missões foram concluídas
];







