/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if movState != enemy_mov.intro or movState != enemy_mov.dying or movState != SNIPER.CHARGING
{
	instance_destroy(other);
	hitpoints._current -=1;
	if flash_t <= 0
	{
	flash_t = 1;
	}	
}
audio_play_sound(choose(snd_hit01, snd_hit02),Sounds.lazer,false,0.3);

if (hitpoints._current<= 0) {
 
    switch (enemy_class) {
        case 1:
            score += 1 *(10* global.level);
            break;
        case 2:
            score += 5*(10* global.level);
            break;
        case 3:
            score += 20*(100* global.level);
            break;
        case 4:
            score += 10*(10* global.level);
            break;
		}
		instance_destroy(other);
	}	











