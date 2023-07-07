/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if instance_exists(O_boss_beholder) 
and O_boss_beholder.movState == BOSSmov_state.intro
and room_alarmBoss = false
{
	room_alarmBoss = true;
	audio_stop_all();
	audio_play_sound(snd__alarm__1_, 50,true)	
}else if instance_exists(O_boss_beholder)
and O_boss_beholder.movState != BOSSmov_state.intro
and room_alarmBoss == true
{
	room_alarmBoss = false;
	audio_stop_sound(snd__alarm__1_);
	audio_play_sound(snd_boss_fight,50,true);
}else 
{
	audio_stop_sound(snd_boss_fight);	
}
