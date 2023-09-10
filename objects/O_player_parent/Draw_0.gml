/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_self();

//draw alpha after hit
if alarm[1] >0 {	
	if image_alpha >= 1{		
		damage_alpha = -0.05; 
		}else if image_alpha <= 0 {	
			damage_alpha = 0.05;		
			}
		image_alpha += damage_alpha;	 
	}else{	
		image_alpha = 1;
		}
draw_text(mouse_x,mouse_y, alarm[3])












