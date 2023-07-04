/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (movState != BOSSmov_state.intro and movState != BOSSmov_state.dying)
{
	beholder_life -= irandom(10);
	audio_play_sound(choose(snd_hit01, snd_hit02),Sounds.hits,false);
	instance_destroy(other);
}