/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var _mx = device_mouse_x(0);
var _my = device_mouse_y(0);
var _guiL = display_get_gui_width();
var _guia = display_get_gui_height();
var _scale =  6;
var _ship01 = spr_USS_Cerulean;
var _ship02 = spr_USS_Emberstrike;
// Ship USS Cerulean
var _ship01_L = sprite_get_width(_ship01) * _scale;
var _ship01_A = sprite_get_height(_ship01) * _scale;
var _guiship01_L =  _guiL/2.4 - _ship01_L/2;  // dividir o tamanho da sprite 
var _guiship01_A = _guia/2 - _ship01_A/2;
// USS Emberstrike
var _ship02_L = sprite_get_width(_ship02) * _scale;
var _ship02_A = sprite_get_height(_ship02) * _scale;
var _guiship02_L =  _guiL/1.2 - _ship02_L/2;  // dividir o tamanho da sprite 
var _guiship02_A = _guia/2 - _ship02_A/2;
//rotação das sprites no seletor
if pick_ship	
{
	if point_in_rectangle(_mx, _my, (_guiship01_L + 50) - _ship01_L, (_guiship01_A + 50) - _ship01_A, _guiship01_L + 50, _guiship01_A + 50) 
	{
	    targetAngle += rotationSpeed; // Incrementa o ângulo de destino
		if mouse_check_button(mb_left)	
		{	
		instance_create_layer(450,1070,"instances", O_USS_Cerulean);	
		pick_ship = false;
		}
	}else if point_in_rectangle(_mx, _my, (_guiship02_L + 50) - _ship02_L, (_guiship02_A + 50) - _ship02_A, _guiship02_L + 50, _guiship02_A + 50){	
		 targetAngle += rotationSpeed; // Incrementa o ângulo de destino
		 if mouse_check_button(mb_left)	
		{	
		instance_create_layer(450,1070,"instances", O_USS_Emberstrike);	
		pick_ship = false;
		}
		}
}
	





