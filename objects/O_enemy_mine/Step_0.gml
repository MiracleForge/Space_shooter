/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

switch (minestates) {
    case STATES_MINE.UNARMED:
        if (speed >= 0) {
            speed -= 0.05; // Reduz a velocidade gradualmente
        }
        
        if (speed <= 0) {
            minestates = STATES_MINE.ARMED; // Quando a velocidade chega a zero, muda o estado da mina para ARMED
        }
    break;
    
    case STATES_MINE.ARMED:
        vspeed = 1; // Define a velocidade vertical para 1 (pode ser a velocidade de queda da mina)
        var _maxincrement = 5; // Valor máximo para o aumento ou diminuição da escala
        var _scale = 6; // Tamanho original da sprite
		var _detonation_distance = 5; //distancia para detonar
        var _close_distance = 70; // distancia para avisar o player
		var _dist_to_ship = distance_to_object(O_ship_parent);
        // na distancia a mina avisa o jogador do perigo
        if (_dist_to_ship <= _close_distance) {
            mineEff = true; // Define a variável mineaAprox como verdadeira para indicar que a mina está próxima e ativa um efeito brilhante (shiny effect)
            
            if (is_incrementing) {
                increment += 0.5 * sign(_maxincrement - increment); // Aumenta ou diminui o incremento gradualmente
                increment = clamp(increment, 0, _maxincrement); // Limita o valor do incremento entre 0 e _maxincrement
            } else {
                increment -= 0.5 * sign(increment); // Diminui o incremento gradualmente
                increment = clamp(increment, -_maxincrement, 0); // Limita o valor do incremento entre -_maxincrement e 0
            }
            
            // Aplica o incremento ou decremento à escala da sprite usando uma variável separada
            var _new_scale = _scale + increment;
            image_xscale = _new_scale;
			image_yscale = _new_scale; // Atualiza a escala da sprite
            
            if (increment == 0 || increment == _maxincrement) {
                is_incrementing = !is_incrementing; // Alterna entre inflação e deflação da sprite
            }
        } else {
            // Restaura o tamanho original da sprite quando o player não está próximo
            image_xscale = _scale;
			image_yscale = _scale;
            mineEff = false; // Define a variável mineaAprox como falsa para indicar que o player não está próxima e desativa o efeito brilhante
        }
        if (_dist_to_ship <= _detonation_distance) {
            // Ativa a colisão com a nave quando a mina está dentro da distância de detonação
               if O_ship_parent.take_damage
			   {
				explosion_range = true;
				 }else 
					 {
				  	effect_create_above(ef_ellipse,x,y,4,c_red);
					effect_create_above(ef_flare,x,y,1,c_red);
					audio_play_sound(snd_impact,1,false, 0.4);
					instance_destroy();
			   }
		
        }
    break;
}


			
