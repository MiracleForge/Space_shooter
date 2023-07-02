/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Dentro do evento Create do objeto


     dest_x = irandom_range(50, 680);
     dest_y = irandom_range(50, 600);
var veloc = 5; // Velocidade de movimento

var walking = false; // Variável de controle para indicar se está andando

// Dentro do evento Step do objeto
if (!walking) {
    var destiny = distance_to_point(dest_x, dest_y);
    var _direction = point_direction(x, y, dest_x, dest_y);

    h_speed = lengthdir_x(veloc, _direction);
    v_speed = lengthdir_y(veloc, _direction);
	

    if (destiny <= veloc) {
        x = dest_x;
        y = dest_y;
        walking = false;

        // Escolher novo destino
        dest_x = irandom_range(50, 680);
        dest_y = irandom_range(50, 600);
    } else {
        walking = true;
		if alarm[0] == -1
		{
			alarm[0] = 30;	
		}
    }
}

