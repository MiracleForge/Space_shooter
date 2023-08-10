/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var timeSinceLastCheck = 0;
var _max_inst = 20 + global.level;
if (!Ogame.pick_ship) {

		// Atualiza o temporizador aide ship
timeSinceLastCheck += delta_time;

// Verifica se o tempo atingiu o limite de 1 segundo
if (timeSinceLastCheck >= 1) {
    // Gera um número aleatório entre 0 e 1
    var randomValue = random(1000 - global.level);

    // Verifica se o número aleatório está dentro da probabilidade desejada
    if (randomValue <= 0.125) {
        // 12.5% de chance de criar a instância OaideShip em cima
        var random_posX = irandom_range(10, 720);
        instance_create_layer(random_posX, 1275, "instances", OaideShip);
    } else if  (room == rm_game_1_2 and randomValue > 0.125 && randomValue <= 0.375) {
        // 25% de chance de criar a instância OaideShip acima
        var randomX = irandom_range(10, 720);
        instance_create_layer(randomX, -20, "instances", Osatellite);
    }else if  (room == rm_game_1_2 and randomValue > 0.105 && randomValue <= 0.375) {
        // 25% de chance de criar a instância OaideShip acima
        var randomX = irandom_range(10, 720);
        instance_create_layer(randomX, -20, "instances", ObigMeteor_sat);
    }

    // Reinicia o temporizador
    timeSinceLastCheck = 0;
}


if (!instance_exists(O_boss_beholder) && alarm[0] != -1)
{
    // Definição dos intervalos de spawn e parâmetros de cada inimigo
    //[1][0]: Intervalo de spawn;
    //[1][1]: Tipo de inimigo;
    //[1][2]: Quantidade de inimigos a serem spawnados (varia entre 1 e global.level);
    //[1][3]: Coordenadas de spawn [0, 720, 0, -20]
    var spawnIntervals = [
        [40 - global.level, O_enemy_01, irandom_range(1, 1), [0, 720, 0, -20]],
        [380 - global.level, O_enemy_stalker, irandom_range(1, global.level), [0, 720, 0, -20]],
        [3000, O_enemy_sniper, 1, [0, 720, 0, -20]],
        [1000, O_enemy_assault, irandom_range(3, 3 + global.level), [choose(0, -20), choose(720, 740), 176, 776]],
        [40, ObigMeteor, irandom_range(1, 1), [0, 720, 0, -20]]
    ];

    // Calcula o valor do alarme apenas uma vez
    var alarmValue = alarm[0];

    // Verifica a quantidade atual de inimigos
    var currentEnemies = instance_number(O_enemy_parent);
    // Calcula o número máximo de inimigos que podem ser criados
    var maxAvailable = _max_inst - currentEnemies;

    // Loop para verificar o spawn de cada inimigo
    for (var i = 0; i < array_length(spawnIntervals); i++)
    {
        var spawnInterval = spawnIntervals[i][0];
        var enemyType = spawnIntervals[i][1];
        var maxSpawnAmount = spawnIntervals[i][2];
        var spawnCoordinates = spawnIntervals[i][3];

        // Verifica se é o momento de fazer o spawn baseado no alarme (usando a variável alarmValue)
        if (alarmValue % spawnInterval == 0)
        {
            // Verifica se o objeto pode spawnar na room atual
            var canSpawn = false;
            var roomName = room_get_name(room);

            if (ds_map_exists(spawnAllowed, roomName))
            {
                var allowedEnemies = spawnAllowed[? roomName];
                canSpawn = (find_index_in_array(enemyType, allowedEnemies) != -1);
            }

            // Verifica se o inimigo pode ser spawnado na room atual
            if (canSpawn)
            {
                // Calcula a quantidade máxima que pode ser criada para esse tipo de inimigo
                var spawnAmount = min(maxAvailable, maxSpawnAmount);

                // Cria as novas instâncias
                for (var j = 0; j < spawnAmount; j++)
                {
                    var randomX = irandom_range(spawnCoordinates[0], spawnCoordinates[1]);
                    var randomY = irandom_range(spawnCoordinates[2], spawnCoordinates[3]);

                    instance_create_layer(randomX, randomY, layer, enemyType);
                    maxAvailable--; // Reduz o número máximo disponível após criar uma instância
                }
            }
        }
    }
}
}
