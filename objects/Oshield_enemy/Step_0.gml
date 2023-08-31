/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (!instance_exists(target)) {	
    instance_destroy();
} else {

  var enemy_parent = target;
    x = enemy_parent.x + lengthdir_x(30, enemy_parent.image_angle);
    y = enemy_parent.y + lengthdir_y(30, enemy_parent.image_angle);

    
    direction = enemy_parent.direction; // Mantém a direção original da nave
    image_angle = enemy_parent.image_angle;
}
