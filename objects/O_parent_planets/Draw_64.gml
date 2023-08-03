/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
/// Definição de cores
var C = c_white;   // Definindo a cor branca para a variável C
var c = c_black;   // Definindo a cor preta para a variável c
var cA = c_aqua;   // Definindo a cor aqua (azul claro) para a variável cA

if (open_gui == true)
{
    var _alpha = 0.8;   // Define a opacidade (transparência) do painel
    draw_set_alpha(_alpha); // Desativar temporariamente a transparência para esse trecho de código (linhas 12-14)
    draw_rectangle_color(0, 0, room_width, room_height, c, c, c, c, false); // Desenhar um retângulo preenchido de cor preta (background)

    // Informações sobre botões e sprites
    var _button_name = ["Mission 3 ", "Mission 2", "Mission 1", "Exit"];  // Nomes dos botões

    // Desenhar sprites e textos para cada botão
    var _mission_description = [
        ["ice", "ice mission", "Ice mission 2", "ice missrion 3"],
        ["Water", "Mission water 1", "Mission water 2", "Mission water 3"],
        ["Earth_like", "Mission earth", "Mission earth 2", "Mission earth 3"],
        ["lava", "Mission lava", "Mission lava 2", "Mission 3 lava"],
        ["Calisto", "Mission calisto", "Mission 2 calisto","Mission 3 calisto"],
    ]; 
 
	var _planet_description = [
		["ice", "ice description"],
        ["Water", "water description"],
        ["Earth_like", "earth description"],
        ["lava", "lava description"],
        ["Calisto", "calisto description"],
	];
    var _sprite_count = array_length(_sprites); // Obtém a quantidade de sprites
    for (var i = 0; i < _sprite_count; i++) {
        draw_sprite_ext(_sprites[i], image_index, _x_positions[i], _y_positions[i], _xscales[i], _yscales[i], 0, C, 1); // Desenha o sprite na posição correta
     
			draw_set_font(Fnt_Menu);
			  // A variável "textIndex" é utilizada para determinar qual descrição do planeta será exibida.
			// Dependendo do valor de "sprite_index[i]", "textIndex" será ajustada para um valor específico.
			var textIndex = i; // Define "textIndex" inicialmente como "i", ou seja, o índice atual do loop (0, 1, 2, ...).
			if (sprite_index[i] == Ice) // Se o valor de "sprite_index[i]" for igual a "Ice" (se o sprite atual for associado ao "Ice"),
			    textIndex = 0; // Define "textIndex" como 0, para que a descrição "ice" seja exibida.
			else if (sprite_index[i] == Terran1) // Se o valor de "sprite_index[i]" for igual a "Terran" (se o sprite atual for associado ao "Terran"),
			    textIndex = 1; // Define "textIndex" como 1, para que a descrição "Terran" seja exibida.
			else if (sprite_index[i] == Earth) // Se o valor de "sprite_index[i]" for igual a "Earth" (se o sprite atual for associado ao "Earth"),
			    textIndex = 2; // Define "textIndex" como 2, para que a descrição "Earth_like" seja exibida.
			else if (sprite_index[i] == Lava) // Se o valor de "sprite_index[i]" for igual a "Lava" (se o sprite atual for associado ao "Lava"),
			    textIndex = 3; // Define "textIndex" como 3, para que a descrição "lava" seja exibida.
			else if (sprite_index[i] == Baren) // Se o valor de "sprite_index[i]" for igual a "Baren" (se o sprite atual for associado ao "Baren"),
			    textIndex = 4; // Define "textIndex" como 4, para que a descrição "Baren" seja exibida.
				
	// Defina a descrição padrão (1) e use o operador ternário para atualizá-la conforme as condições.
	// se mission3 é true  o valor é 3 , se não verificar se o valor de mission 2 é true , se é valor é 2 e não é 1
	var descriptionIndex = mission3 ? 3 : (mission2 ? 2 : 1);

		// Verifica se a descrição do planeta está habilitada (valor true ou false)
        draw_text_ext_color(408, 670, _mission_description[textIndex][descriptionIndex], string_height("M"), 300, c_white, c_white, c_white, c_white, 1); // Desenha o texto de descrição
		// Desenha a descrição dos planetas
		draw_text_ext_color(100,1050,_planet_description[textIndex][1], string_height("M"),300,C,C,C,C,1);
    }

    var _button_name_x = _x_positions[5] + 40; // Posição horizontal inicial para desenhar os nomes dos botões

    // Desenhar os nomes dos botões
	  for (var i = 0; i < 4; i++) {
		
	    var _button_name_y = _y_positions[5 + i] + 20;
	    draw_text_ext_color(_button_name_x, _button_name_y, _button_name[i], string_height("M"), 300, cA, cA, cA, cA, 1); 
	}

    /// Verificar clique nos botões e manipular ações
	var btn_exit =     create_button_data(8, 95, 580, 315, 640); // x direita e esquerda é igual para todos os botões
    var btn_mission3 = create_button_data(5, 95, 440, 315, 510); //Diferença entre btn_mission3 e btn_exit = 140
    var btn_mission2 = create_button_data(6, 95, 338, 315, 390); //Diferença entre btn_mission2 e btn_mission3 = 102
    var btn_mission1 = create_button_data(7, 95, 210, 315, 270); //Diferença entre btn_mission1 e btn_mission2 = 128
	
    if (mouse_check_button_pressed(mb_left)) {
		var scale_speed = 0.2
        // Verifica se o clique do mouse está dentro da área de algum botão
        if (point_in_button(mouse_x, mouse_y, btn_mission3)) {
			show_message("mission 3")
            mission3 = true;
			mission2 = false;
			mission1 = false;
            audio_play_sound(snd_button, 0, false); 
            
        } else if (point_in_button(mouse_x, mouse_y, btn_mission2)) {
			show_message("mission 2")
            mission2 = true; // Define a variável "mission" como true
			mission1 = false;
			mission3 = false;
            audio_play_sound(snd_button, 0, false);
            
        } else if (point_in_button(mouse_x, mouse_y, btn_mission1)) {
			show_message("mission 1")
			mission3 = false;
			mission2 = false;
            mission1 = true; // Define a variável "mission" como false
            audio_play_sound(snd_button, 0, false);
            
        } else if (point_in_button(mouse_x, mouse_y, btn_exit)) {
			show_message("exit")
            open_gui = false; // Fecha o painel
			planet_select = false;
            mission2 = false; // Define a variável "mission" como true
			mission1 = true;
			mission3 = false;
            audio_play_sound(snd_button, 0, false);
            
        }
    }
	
    //draw_set_alpha(-1); // Restaurar a transparência padrão (linhas 54-56)
}








