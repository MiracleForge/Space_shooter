

if object_index == OpowerUPs {
var powerUpIndex = round(OpowerUPs.image_index);
	OpowerUPs.spark = true;
	
	with (O_player_parent) {
	    current_life += 1;
	    if (powerUpIndex == 0 || (powerUpIndex == 1 && shield_active)) {
	        if (powerUpIndex == 1) {
	            shield += min(10, max_shield - shield);
	        }
	    }
	    if (powerUpIndex == 2 && shield_active) {
	        shield = max_shield;
	    }
	}

}else 
{

// Adicione os poderes especiais com seus sprites à ds_list
var power1 = spr_Missile; // Sprite do poder 1
var power2 = spr_Missile; // Sprite do poder 2
var power3 = spr_Missile; // Sprite do poder 3

var powers_list = O_player_parent.powers_list; // Simplificando o acesso à lista

// Verifique se há uma posição com valor -1
var empty_position = -1;
for (var i = 0; i < ds_list_size(powers_list); i++) {
    if (powers_list[|i] == -1) {
        empty_position = i;
        break; // Encontrou uma posição vazia, saia do loop
    }
}

// Se houver uma posição vazia, substitua-a com um novo poder
if (empty_position != -1) {
    var _random_power = choose(power1, power2, power3);
    powers_list[|empty_position] = _random_power;
}





}			
				//O_player_parent.player_special_attack = _random_special;
		

instance_create_layer(O_player_parent.x, O_player_parent.y, "Instances", Ospark);
instance_destroy();

// Adicionar um poder especial à lista
//var special_power = "Bomber"; // Nome do poder especial
