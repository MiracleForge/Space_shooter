/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

	if O_enemy_mine.explosion_range
	{
		if (take_damage == true) 
		{
			alarm[2] = 260;   
			take_damage = false;
			life_ship -= 1;
		}
		with(O_enemy_mine.id)
		{
			effect_create_above(ef_explosion,x,y, 1, c_red);
			instance_destroy();
		}
}

			
	