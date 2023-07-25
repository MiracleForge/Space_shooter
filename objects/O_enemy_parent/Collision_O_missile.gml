/// @description Inserir descrição aqui

effect_create_above(ef_explosion,x,y,0.1,c_orange);	
	
life = 0;
if (life <= 0) {
 
    switch (enemy_type) {
        case 1:
            score += 1 *(10* global.level);
            break;
        case 2:
            score += 5*(10* global.level);
            break;
        case 3:
            score += 20*(100* global.level);
            break;
        case 4:
            score += 10*(10* global.level);
            break;
	
		}
		instance_destroy();
		instance_destroy(other);
	}
