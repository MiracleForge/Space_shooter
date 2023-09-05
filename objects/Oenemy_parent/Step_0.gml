/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if hitpoints._current <=0{
	movState = enemy_mov.dying
	}

if movState = enemy_mov.dying
{
	effect_create_above(ef_ellipse,x,y,4,c_orange);
	effect_create_above(ef_flare,x,y,1,c_orange);
	audio_play_sound(snd_impact,1,false, 0.4);


	switch (Oenemy_parent.enemy_class)
		 {
			 case 1:
			      score += 1 * (10 * global.level);
			      break;
			 case 2:
			      score += 5 * (10 * global.level);
			      break;
			 case 3:
			      score += 20 * (100 * global.level);
			      break;
			 case 4:
			      score += 10 * (10 * global.level);
			      break;
		}
	instance_destroy();
}













