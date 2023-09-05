/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_self();
scr_blend_light(360 ,15,3,image_xscale,image_yscale,image_angle,image_blend,0.01,false);

switch(missil_lockON){
	case missil_state.off_line:
		draw_text(x -50, y, "off_line")
	break;
	case missil_state.following:
		draw_text(x -50, y, "following")
	break;
	case missil_state.no_target:
		draw_text(x -50, y, "no_target")
	break;
	case missil_state.explod:
		draw_text(x -50, y, "explod")
	break;
}







