/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if (!Ogame.pick_ship) {
    if (alarm[0] == -1) {	
        alarm[0] = 18000;
    }
    if (counter_attack) {
        var spawnIntervals = [
            [40, O_enemy_01, irandom_range(1, 1), [0, 720, 1200, 1200]],
            [380, O_enemy_stalker, irandom_range(1, global.level), [0, 720, 1200, 1200]],
            [800, O_enemy_assault, irandom_range(3, 1 + global.level), [choose(0,-20), choose(720,740), 500, 776]]
        ];

        for (var i = 0; i < array_length(spawnIntervals); i++) {
            var spawnInterval = spawnIntervals[i][0] - global.level;
            var enemyType = spawnIntervals[i][1];
            var spawnAmount = spawnIntervals[i][2];
            var spawnCoordinates = spawnIntervals[i][3];

            if (alarm[0] % spawnInterval == 0) {
                for (var j = 0; j < spawnAmount; j++) {
                    var randomX = irandom_range(spawnCoordinates[0], spawnCoordinates[1]);
                    var randomY = irandom_range(spawnCoordinates[2], spawnCoordinates[3]);

                    var _inst = instance_create_layer(randomX, randomY, layer, enemyType);
                		_inst.speed = -2;
						_inst.image_angle = direction;
						_inst.image_yscale = -_inst.image_yscale;
					    _inst.enemy_direction = true;
		
						alarm[0] = 1000;
						counter_attack = false;
				}
            }
        }
    }
}

/*
var _start_att = Ocollision.ship_counter_attack;
if (!Ogame.pick_ship) 
{
	if alarm[0] == -1 {	
		alarm[0] =18000;
		}
	if counter_attack 
	{
		
		repeat(10)
		{
			var randomX01 = irandom_range(0, 700);
			var randomY01 = 1200;
			var _inst = instance_create_layer(randomX01, randomY01, layer, choose(O_enemy_01, O_enemy_stalker));
			_inst.speed = -2;
			_inst.image_angle = direction;
			_inst.image_yscale = -_inst.image_yscale;
		    _inst.enemy_direction = true;
		
			alarm[0] = 1000;
			counter_attack = false;
		
	}
}

}