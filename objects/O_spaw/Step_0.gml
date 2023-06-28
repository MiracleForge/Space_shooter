/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (!Ogame.pick_ship) {
	
	if O_spaw_conter_atk.counter_attack == false {
	    var spawnEnemy01 = (alarm[0] % 40 - global.level) == 0;
	    var spawnEnemystalker = (alarm[0] % 1000 - global.level) == 0;
    
	    if (spawnEnemy01) {
	        var randomX01 = irandom_range(0, 710);
	        var randomY01 = irandom_range(0, -20);
	        instance_create_layer(randomX01, randomY01, layer, O_enemy_01);
		
	    }
    
	    if (spawnEnemystalker) {
	        var randomXClose = irandom_range(0, 720);
	        var randomYClose = irandom_range(0, -20);
	        instance_create_layer(randomXClose, randomYClose, layer, O_enemy_stalker);
			if !instance_exists(O_enemy_sniper){	
				instance_create_layer(randomXClose, randomYClose, layer, O_enemy_sniper);
				}
		
	    }
	}
}
