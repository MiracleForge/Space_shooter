/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();
/*
    if (alarm[0] == -1) // time to shoot
{
	    alarm[0] = 480;
}
if Pyexist
{
	var _ship = O_ship_parent;
	var _dest_x = _ship.x;
	var _dest_y = _ship.y;
if (x <= 100) {
    direction = 1; // Muda a direção para a direita
} else if (x >= 700) {
    direction = -1; // Muda a direção para a esquerda
}
if direction == 1{	
	hspeed = 1
	}else {	
		hspeed = -1;
		}
	
		var _dir_to_player = point_direction(x, y, _dest_x, _dest_y);
		image_angle = _dir_to_player;
}
	*/



if !instance_exists(O_ship_parent)
{
	return;	
}
	var _dir_to_pos = point_direction(x, y, O_ship_parent.x, O_ship_parent.y);
	image_angle = _dir_to_pos;

	switch (stateSniper)
	{

		case SNIPER.WALK:
		stateSniper = SNIPER.WALK
		image_alpha = 0.3;
		x = lerp(x,position.next._x,0.01);
		y = lerp(y,position.next._y,0.01);
	
		if alarm[1] == -1
				//mudar starte.
				{
					alarm[0] = 480; // alarm to shoot lazer
					stateSniper = SNIPER.SHOOTING;
				
				}
		break;
		case SNIPER.SHOOTING:
		stateSniper = SNIPER.SHOOTING
		// Declaração e inicialização da variável
		var target_alpha = 1; // Valor final que você deseja alcançar (1 no caso, para que a imagem seja completamente visível)
		var alpha_speed = 0.01; // Velocidade de aumento, ajuste conforme necessário (quanto menor, mais lento)

		// Atualização do valor intermediário (interpolação)
		if (image_alpha < target_alpha) {
		    image_alpha += alpha_speed;
		    if (image_alpha >= target_alpha) {
		        image_alpha = target_alpha; // Garante que o valor não ultrapasse o valor final desejado
		
		    }
		}
		if (alarm[0] == -1) // time to shoot
			{
		    var _ship = O_ship_parent;

			if instance_exists(_ship) and !instance_exists(O_enemy_lazer)
			{
			   instance_create_layer(_ship.x, _ship.y, "Enemy_layer", O_enemy_lazer);
			}

			// restart states and position of sniper
			var _room_posX = room_width - 30;

			position.next._x = irandom_range(96, _room_posX);
			position.next._y = irandom_range(96, room_height);
			alarm[1] = enemy_movement_time;

			// Change state to WALK only if the current state is not SHOOTING

			    stateSniper = SNIPER.WALK;
			}
		break;
	}







