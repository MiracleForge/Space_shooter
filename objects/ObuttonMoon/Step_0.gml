/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var grav_center_x = ObuttonEarth.x;
var grav_center_y = ObuttonEarth.y;
if check 

{
orbit_dir += orbit_speed;

// Calculate the new position of "Obuttonmoon" using trigonometry
x = grav_center_x + orbit_distance * cos(degtorad(orbit_dir));
y = grav_center_y + orbit_distance * sin(degtorad(orbit_dir));
}
// Substitua "Obuttonearth" pelo nome do objeto específico



    // Obtenha a posição y do topo do sprite do objeto específico
var sprite_top_y = ObuttonEarth.y - sprite_get_yoffset(ObuttonEarth.sprite_index);

// Verifica se o objeto atual atingiu a borda superior do objeto específico
if (y <= sprite_top_y + 18)
{
    
     
        // Se o objeto atingiu a borda superior e visible_moom é true, torne-o invisível
        visible = false;
    }else{
    
     
        // Se o objeto atingiu a borda superior e visible_moom é false, torne-o visível
        visible = true;
    
}










