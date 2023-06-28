/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


event_inherited();
var _enemy = O_enemy_parent;
// Inherit the parent event

 var some_threshold_value = 10;
var dest_x = image_angle;
var dest_y = image_angle;
// Verifica se o míssil já está perseguindo um inimigo
if (target_enemy == noone) {
    // Encontra um inimigo disponível para perseguir

    
    if (instance_count > 0) {
        // Escolhe aleatoriamente uma instância de inimigo
        var random_index = irandom(instance_count - 1);
        target_enemy = instance_find(_enemy, random_index);
        is_targeting_enemy = true;
    }
}

// Verifica se o míssil está perseguindo um inimigo
if (is_targeting_enemy && instance_exists(target_enemy)) {
    var dest_x = target_enemy.x;
    var dest_y = target_enemy.y;
    var _dir = point_direction(x, y, dest_x, dest_y);
    
    if (distance_to_object(target_enemy) > some_threshold_value) {
        hspeed = lengthdir_x(speed, _dir);
        vspeed = lengthdir_y(speed, _dir);
        direction = direction;
        image_angle = -_dir;
		speed = 8
    } else {
        // O inimigo foi alcançado, redefine o alvo para liberar o míssil
        target_enemy = noone;
        is_targeting_enemy = false;
    }
} else {
	// se o inimigo não existe mais apenas continua seu caminho;
  	 var _dir = (point_direction(x, y, dest_x, dest_y));
		speed = 8
		direction = direction;
	    image_angle = -_dir
}
