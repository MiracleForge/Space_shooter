/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Adicione os poderes especiais com seus sprites à ds_list // Os poderes são identificados usando as sprites 
var _power1 = spr_Missile; // Sprite do poder 1
var _power2 = Spr_white_scolt; // Sprite do poder 2
var _power3 = spr_Missile; // Sprite do poder 3

var _powers_list = O_player_parent.powers_list; // Simplificando o acesso à lista
// Verifique se há uma posição com valor -1
var _empty_position = -1;
	for (var i = 0; i < ds_list_size(_powers_list); i++) {
	    if (_powers_list[|i] == -1) {
	        _empty_position = i;
	        break; // Encontrou uma posição vazia, saia do loop
	    }
	}

	// Se houver uma posição vazia, substitua-a com um novo poder
	if (_empty_position != -1) {
	    var _random_power = choose(_power1, _power2, _power3);
	    _powers_list[|_empty_position] = _random_power;
	}


instance_destroy();















