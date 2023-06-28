/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
   var randomXClose = irandom_range(0, 720);
   var randomYClose = irandom_range(0, -20);
	    if !instance_exists(O_enemy_sniper){
instance_create_layer(randomXClose, randomYClose, layer, O_enemy_sniper);
		}