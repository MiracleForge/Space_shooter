/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if room == rm_game_1_1
{
if global.pause == false
        {
        instance_activate_all();
        surface_free(paused_surf);
                paused_surf = -1;
        }
    
if global.pause == true
    {
    alarm[0]++;
    alarm[1]++;
    
}
}


