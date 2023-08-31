/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
instance_destroy(other);
if movState != stalker_mov.intro or movState != stalker_mov.dying
{
	hitpoints._current -=1;
	if flash_t <= 0
	{
	flash_t = 1;
	}	
}
audio_play_sound(choose(snd_hit01, snd_hit02),Sounds.lazer,false,0.3);













