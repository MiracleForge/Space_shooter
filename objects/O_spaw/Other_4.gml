/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Defina quais inimigos podem spawnar em quais rooms usando o dicionário spawnAllowed
// O formato é: ds_map_add(spawnAllowed, "nome_da_room", [inimigo_1, inimigo_2, ...]);
//alarm[0] = 18000;	
// Por exemplo, permitir que O_enemy_01 e O_enemy_stalker spawnem na "rm_game_1_1":
ds_map_add(spawnAllowed, "rm_game_1_1", [O_enemy_01, O_enemy_stalker,O_enemy_sniper,O_enemy_assault]);

// Permitir que O_enemy_sniper e O_enemy_stalker spawnem na "rm_game_1_2":
ds_map_add(spawnAllowed, "rm_game_1_2", [O_enemy_01, O_enemy_stalker,O_enemy_sniper,O_enemy_assault,ObigMeteor]);












