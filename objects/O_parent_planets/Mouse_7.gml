/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

audio_play_sound(snd_button,0,false);
// Criação da ds_list para armazenar os objetos filhos relevantes
var children_list = ds_list_create();

// Loop para atribuir os valores de i em planet_id
for (var i = 0; i < instance_number(O_parent_planets); ++i)
{
    var current_planet = instance_find(O_parent_planets, i);
    planets[i] = current_planet;

    if (id == current_planet) /*
							    se o valor do id do planeta clicado for igual ao valor de current_planet
								interrompe o loop.
							  */
    {
        // crei uma lista com todos os objetos filhos do O_parent_planets
		// adicianar mais filhos caso eu criei mais planetas;
        ds_list_add(children_list, Obuttonwater);
        ds_list_add(children_list, ObuttonCalisto);
        ds_list_add(children_list, ObuttonIce);
        ds_list_add(children_list, Obuttonlava);
        ds_list_add(children_list, ObuttonEarth);

        /*
		   percorre a lista e atualiza as variaveis próprias em cada filho
		   Por que fiz isso? fiz isso por que a variavel interna de cada filho, só atualizava quando 
		   o clique acontecia especificamente em cima do filho clicado.
		   assim eu tive que forçar a atualização usando outro loop ou with() mas with era horrivel.
		*/
        for (var j = 0; j < ds_list_size(children_list); j++) // percorre a lista
        {
            var current_child = ds_list_find_value(children_list, j); // salva o filho especifico 
            current_child.planet_id = planets[i]; // modifica sua variavel interna
        }

        break;
    }
}

// Libera a ds_list após seu uso
ds_list_destroy(children_list);





    
 







