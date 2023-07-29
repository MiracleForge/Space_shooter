/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
event_inherited();

joy_x = 0;
joy_y = 0;
//armazena o id do toque
touch_id = -1;
// calcula o raio baseado na sprite do joystick
radius = sprite_width / 2;

// os argumentos armazenam o id e as cordenadas do toque a tela sensivel 
input = function (_touch_id, _touch_x, _touch_y)
{
	// armazena o id do toque
        touch_id = _touch_id;
}

