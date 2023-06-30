/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if distance_to_object(O_ship_parent) <= detonation_distance{	
	effect_create_above(ef_explosion,x,y, 1, c_red);
	instance_destroy();
	}