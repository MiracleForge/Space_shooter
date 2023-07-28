/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _ship = O_ship_parent;

	if instance_exists(_ship) and !instance_exists(O_enemy_lazer)
	{
	   instance_create_layer(_ship.x, _ship.y, "Enemy_layer", O_enemy_lazer);
	}


