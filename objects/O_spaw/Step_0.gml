/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var timeSinceLastCheck = 0;
if (!Ogame.pick_ship) {
    if (alarm[0] == -1) {	
        alarm[0] = 18000;

    }
		// Atualiza o temporizador aide ship
	timeSinceLastCheck += delta_time;

	// Verifica se o tempo atingiu o limite de 1 segundo
	if (timeSinceLastCheck >= 1) {
	    // Gera um número aleatório entre 0 e 1
	    var randomValue = random(1000 - global.level);

	    // Verifica se o número aleatório está dentro da probabilidade desejada
	    if (randomValue <= 0.25) {
	     var random_posX = irandom_range(10,720);
		instance_create_layer(random_posX, 1275,"instances",OaideShip);
	    }

	    // Reinicia o temporizador
	    timeSinceLastCheck = 0;
	}
	// enemy_ships spawner
    if (!O_spaw_conter_atk.counter_attack) and !instance_exists(O_boss_beholder) 
	{
        var spawnIntervals = [
            [40, O_enemy_01, irandom_range(1, 1), [0, 720, 0, -20]],
            [380, O_enemy_stalker, irandom_range(1, global.level), [0, 720, 0, -20]],
            [3000, O_enemy_sniper, 1, [0, 720, 0, -20]],
            [1000, O_enemy_assault, irandom_range(3, 3 + global.level), [choose(0,-20), choose(720,740), 176, 776]]
        ];

        for (var i = 0; i < array_length(spawnIntervals); i++)
		{
            var spawnInterval = spawnIntervals[i][0] - global.level;
            var enemyType = spawnIntervals[i][1];
            var spawnAmount = spawnIntervals[i][2];
            var spawnCoordinates = spawnIntervals[i][3];

            if (alarm[0] % spawnInterval == 0) {
                for (var j = 0; j < spawnAmount; j++) 
				{
                    var randomX = irandom_range(spawnCoordinates[0], spawnCoordinates[1]);
                    var randomY = irandom_range(spawnCoordinates[2], spawnCoordinates[3]);

                    instance_create_layer(randomX, randomY, layer, enemyType);
                }
            }
        }
    }
	
	
}






