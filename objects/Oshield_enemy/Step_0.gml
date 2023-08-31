/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (!instance_exists(O_enemy_stalker)) {	
    instance_destroy();
} else {

  
    x = O_enemy_stalker.x + lengthdir_x(30, O_enemy_stalker.image_angle);
    y = O_enemy_stalker.y + lengthdir_y(30, O_enemy_stalker.image_angle);

    
    direction = O_enemy_stalker.direction; // Mantém a direção original da nave
    image_angle = O_enemy_stalker.image_angle;
}
