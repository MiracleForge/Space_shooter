/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var powerUpIndex = round(OpowerUPs.image_index);
if powerUpIndex == 0 {
	glow_blend = c_red;
}else if powerUpIndex == 1{
	glow_blend = c_purple
}else if powerUpIndex == 2{
	glow_blend = c_yellow;	
}
scr_blend_light(360,20,6,image_xscale,image_yscale,image_angle,glow_blend,0.1,true);

draw_self();













