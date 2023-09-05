/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Verificações de estado do inimigo

if (movState != enemy_mov.intro or movState != enemy_mov.dying or movState != SNIPER.CHARGING)
{
	switch(other.bullet_name)
	{
		case 1:
			hitpoints._current -= 1;
		break;
		case 2: 
			hitpoints._current = 0;

		break;
	}
    // Se o contador de flash for zero, defina-o para 1
    if (flash_t <= 0)
    {
        flash_t = 1;
    }
    
    // Reproduza o som de impacto
    var hit_sound = choose(snd_hit01, snd_hit02);
    audio_play_sound(hit_sound, Sounds.lazer, false, 0.3);
    
    // Destrua a instância de projetil
    instance_destroy(other);
}












