/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var _start_att = Ocollision.ship_counter_attack;
if (!Ogame.pick_ship) 
{
	if counter_attack 
	{
		
		repeat(10)
		{
			var randomX01 = irandom_range(0, 700);
			var randomY01 = 1200;
			var _inst = instance_create_layer(randomX01, randomY01, layer, choose(O_enemy_01, O_enemy_stalker));
			_inst.speed = -2;
			_inst.image_angle = direction;
			_inst.image_yscale = -_inst.image_yscale;
		    _inst.enemy_direction = true;
		
			alarm[0] = 1000;
			counter_attack = false;
		
	}
}

}