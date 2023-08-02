// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_check_audio_playing(_sound)
{
// This script will check if the audio has finished playing and update the global variable accordingly.
	if (!audio_is_playing(_sound))
	{
		global.audio_is_playing = false;
	}
}


//@function create_button_data
///@param {array} index - O índice do botão que será criado.
///@param {real} left - A posição X à esquerda do botão.
///@param {real} top - A posição Y superior do botão.
///@param {real} right - A posição X à direita do botão.
///@param {real} bottom - A posição Y inferior do botão.

function create_button_data(index, left, top, right, bottom) {
	
	///@description: Esta função cria e retorna um objeto contendo os limites de um botão com base no índice fornecido.
	///Os limites do botão são calculados usando os arrays _x_positions e _y_positions, juntamente com os arrays _xscales e _yscales. O objeto retornado contém quatro propriedades: left (esquerda), top (superior), right (direita) e bottom (inferior), que representam as coordenadas do retângulo que envolve o botão.
	
	var _sprites = [spr_window_frame, spr_menu_organizer, spr_planet_panel, spr_text_box,sprite_index,spr_button_menu_panel,spr_button_menu_panel,spr_button_menu_panel];
    var _x_positions = [1, 86, 0, 364.98,546,86,86,86.001];
    var _y_positions = [0.5, 172.49, 124.5, 640.49,491,560,460,355];
    var _xscales = [0.5679, 1, 1, 0.3356,5,0.8840,0.8840,0.8840];
    var _yscales = [1.5541, 0.9962, 1, 1.47,5.6666,0.3640,0.3640,0.3640];
	
    var btn_left = _x_positions[index];
    var btn_right = _x_positions[index] + _xscales[index];
    var btn_top = _y_positions[index];
    var btn_bottom = _y_positions[index] + _yscales[index];
    return { left: left, top: top, right: right, bottom: bottom };
}

///@function point_in_button
///@param {real} x - A posição X do ponto a ser verificado.
///@param {real} y - A posição Y do ponto a ser verificado.
///@param {Pointer} button - O objeto que representa os limites do botão a ser verificado.
function point_in_button(x, y, button) {
	///@description: Esta função verifica se um ponto com as coordenadas (x, y) está dentro dos limites de um botão representado pelo objeto "button".
	///Se o ponto estiver dentro dos limites do botão (dentro do retângulo), a função retorna verdadeiro; caso contrário, retorna falso. 
	///Isso é útil para detectar cliques do mouse em botões específicos na interface do jogo.
    return (x >= button.left && x <= button.right && y >= button.top && y <= button.bottom);
}