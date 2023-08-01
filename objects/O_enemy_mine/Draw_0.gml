/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_self();
scr_blend_light(360,10,3,image_xscale,image_yscale,image_angle,c_red,0.1,false)

if mineEff {	
	if image_alpha >= 1{		
		damage_alpha = -0.05; 
		}else if image_alpha <= 0 {	
			damage_alpha = 0.05;		
			}
		image_alpha += damage_alpha;	 
	}else{	
		image_alpha = 1;
		}
		







