/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var _mina = O_enemy_mine;
if _mina.explosion_range == true
{
	with(O_enemy_mine.id){
	effect_create_above(ef_explosion,x,y, 1, c_red);
	instance_destroy();
}
					
				    if (take_damage == true) {
				        alarm[2] = 260;   
				        take_damage = false;
				        life_ship -= 1;
			    }
			
	}