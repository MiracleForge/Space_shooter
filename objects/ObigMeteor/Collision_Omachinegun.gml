/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
meteor_hp -= 1;
direction = random(360);

if sprite_index == spr_bigMeteors {	
	sprite_index = spr_small_meteors;
	instance_copy(true);
	}else if instance_number(ObigMeteor) <12{	
		sprite_index = spr_bigMeteors;
		x = -100
		}else {	
			if meteor_hp <= 50{
				direction = random(360);
				speed = 1;
				image_xscale = 1;
				image_yscale = 1;
				}else if meteor_hp <=0{	
					instance_destroy();
					}
			}