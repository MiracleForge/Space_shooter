/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if !Ogame.pick_ship
{
	if global.pause == true
	{	
		draw_sprite_ext(Spr_play,1,x - 20,y,0.2,0.2,0,c_white,1);	
	}
		else
		{	
			draw_sprite_ext(Spr_play,0,x - 20,y,0.2,0.2,0,c_white,1);
		}
}
if room != rm_Mapa or room != rm_skillTree
{
	visible = true;
}else 
{
visible = false;	
}