/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if boss_defeated 
	if lock_skill and (skill_dad == noone or skill_dad.lock_skill == false ) 
	{
		if global.player_coin > skill_cost and boss_defeated
		{
			lock_skill  = false;
			global.player_coin -= skill_cost;

		}	
	}

//debug
if !boss_defeated {
boss_defeated = true;	
}








