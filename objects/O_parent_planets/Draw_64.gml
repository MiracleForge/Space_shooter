/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
/// Definição de cores
var C = c_white;   // Definindo a cor branca para a variável C
var c = c_black;   // Definindo a cor preta para a variável c
var cA = c_aqua;   // Definindo a cor aqua (azul claro) para a variável cA

if (open_gui == true)
{
    var _alpha = 0.8;   // Define a opacidade (transparência) do painel
   // draw_set_alpha(_alpha); // Desativar temporariamente a transparência para esse trecho de código (linhas 12-14)
    draw_rectangle_color(0, 0, room_width, room_height, c, c, c, c, false); // Desenhar um retângulo preenchido de cor preta (background)

    // Informações sobre botões e sprites
    var _button_name = ["Planet ", "Mission", "Exit"];  // Nomes dos botões
    var _sprites = [spr_window_frame, spr_menu_organizer, spr_planet_panel, spr_text_box, sprite_index, spr_button_menu_panel, spr_button_menu_panel, spr_button_menu_panel]; // Sprites a serem desenhados
    var _x_positions = [1, 86, 0, 364.98, 546, 86, 86, 86.001]; // Posições horizontais dos sprites
    var _y_positions = [0.5, 172.49, 124.5, 640.49, 491, 560, 460, 355]; // Posições verticais dos sprites
    var _xscales = [0.5679, 1, 1, 0.3356, 5, 0.8840, 0.8840, 0.8840]; // Escalas horizontais dos sprites
    var _yscales = [1.5541, 0.9962, 1, 1.47, 5.6666, 0.3640, 0.3640, 0.3640]; // Escalas verticais dos sprites

    // Desenhar sprites e textos para cada botão
    var _planet_description = [
        ["ice", "Too cold for e-girls living", "You have to save all e-girls living here to death from scorbut, yeah that's right"],
        ["Water", "That Planet is made of pure water from e-girls", "They are selling too much water, start to become wet"],
        ["Earth_like", "E-girls start their dominion here", "You have to stop this shit"],
        ["lava", "Too hot for weak e-girls", "Burn all in lava"],
        ["Calisto", "Nothing here", "Wtf you are doing here"],
    ]; 

    var _sprite_count = array_length(_sprites); // Obtém a quantidade de sprites
    for (var i = 0; i < _sprite_count; i++) {
        draw_sprite_ext(_sprites[i], image_index, _x_positions[i], _y_positions[i], _xscales[i], _yscales[i], 0, C, 1); // Desenha o sprite na posição correta
        draw_set_color(c_aqua); // Define a cor para aqua (azul claro)

draw_set_font(Fnt_Menu);
  // A variável "textIndex" é utilizada para determinar qual descrição do planeta será exibida.
// Dependendo do valor de "sprite_index[i]", "textIndex" será ajustada para um valor específico.
var textIndex = i; // Define "textIndex" inicialmente como "i", ou seja, o índice atual do loop (0, 1, 2, ...).
if (sprite_index[i] == Ice) // Se o valor de "sprite_index[i]" for igual a "Ice" (se o sprite atual for associado ao "Ice"),
    textIndex = 0; // Define "textIndex" como 0, para que a descrição "ice" seja exibida.
else if (sprite_index[i] == Terran) // Se o valor de "sprite_index[i]" for igual a "Terran" (se o sprite atual for associado ao "Terran"),
    textIndex = 1; // Define "textIndex" como 1, para que a descrição "Terran" seja exibida.
else if (sprite_index[i] == Earth) // Se o valor de "sprite_index[i]" for igual a "Earth" (se o sprite atual for associado ao "Earth"),
    textIndex = 2; // Define "textIndex" como 2, para que a descrição "Earth_like" seja exibida.
else if (sprite_index[i] == Lava) // Se o valor de "sprite_index[i]" for igual a "Lava" (se o sprite atual for associado ao "Lava"),
    textIndex = 3; // Define "textIndex" como 3, para que a descrição "lava" seja exibida.
else if (sprite_index[i] == Baren) // Se o valor de "sprite_index[i]" for igual a "Baren" (se o sprite atual for associado ao "Baren"),
    textIndex = 4; // Define "textIndex" como 4, para que a descrição "Baren" seja exibida.


        var descriptionIndex = planet_description ? 1 : 2; // Verifica se a descrição do planeta está habilitada (valor true ou false)
        draw_text_ext_color(408, 670, _planet_description[textIndex][descriptionIndex], string_height("M"), 300, c_white, c_white, c_white, c_white, 1); // Desenha o texto de descrição
    }

    var _button_name_x = _x_positions[5] + 40; // Posição horizontal inicial para desenhar os nomes dos botões

    // Desenhar os nomes dos botões
    for (var i = 0; i < 3; i++) {
        var _button_name_y = _y_positions[5 + i] + 20; // Posição vertical para desenhar o nome do botão atual
        draw_text_ext_color(_button_name_x, _button_name_y, _button_name[2 - i], string_height("M"), 300, C, C, C, C, 1); 
    }

    /// Verificar clique nos botões e manipular ações
    var btn_exit = create_button_data(5, 95, 440, 315, 510); // Define as coordenadas do botão "Exit"
    var btn_mission = create_button_data(6, 95, 338, 315, 390); // Define as coordenadas do botão "Mission"
    var btn_planet = create_button_data(7, 95, 210, 315, 270); // Define as coordenadas do botão "Planet"

    if (mouse_check_button_pressed(mb_left)) {
        // Verifica se o clique do mouse está dentro da área de algum botão
        if (point_in_button(mouse_x, mouse_y, btn_exit)) {
            open_gui = false; // Fecha o painel
            mission = false;
            audio_play_sound(snd_button, 0, false); 
            
        } else if (point_in_button(mouse_x, mouse_y, btn_mission)) {
            mission = true; // Define a variável "mission" como true
            planet_description = false; 
            audio_play_sound(snd_button, 0, false);
            
        } else if (point_in_button(mouse_x, mouse_y, btn_planet)) {
            planet_description = true; 
            mission = false; // Define a variável "mission" como false
            audio_play_sound(snd_button, 0, false);
            
        }
    }
	
    //draw_set_alpha(-1); // Restaurar a transparência padrão (linhas 54-56)
}








