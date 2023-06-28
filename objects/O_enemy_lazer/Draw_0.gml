/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if !instance_exists(O_enemy_lazer) and instance_exists(O_enemy_sniper)
{
draw_line_colour(x,y, xEnd, yEnd, c_red,c_red);
}


for ( j = 0; j <lenght_lazer; j++) {
draw_sprite_ext(Spr_enemy_lazer,0, x + lengthdir_x(j, direction),y+ lengthdir_y(j, direction),1,1,direction,c_white,1 );
}