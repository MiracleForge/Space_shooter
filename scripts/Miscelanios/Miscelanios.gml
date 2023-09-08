// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_check_audio_playing(_sound)
{
    // This script will check if the audio has finished playing and update the global variable accordingly.
    if (!audio_is_playing(_sound))
    {
       
        global.audio_is_playing = false;
        return false; // Retorna false se o áudio não estiver tocando
    }
    else
    {
        global.audio_is_playing = true;
        return true; // Retorna true se o áudio estiver tocando
    }
}

// Função personalizada para encontrar o índice de um valor em um array
// Retorna -1 se o valor não estiver presente no array
function find_index_in_array(value, arr) {
    var len = array_length(arr);
    for (var i = 0; i < len; i++) {
        if (arr[i] == value) {
            return i;
        }
    }
    return -1;
}


function scr_reestart_game()	
{
			global.pause = false; 
			isoundOn = false;
            room_goto(rm_Menu);
            pick_ship = false;
            Pyframe_icon = 0;
            trakying_ship = 1;
            choose_ship = true;
            ship_snd_select = false;



}

/// @function buttons_data_set
/// @description This function takes the values of the chosen array and creates buttons.
/// It returns a value that corresponds to a button; if it is not clicked, it returns -1.
/// @param {array} _array The array containing button information.
/// @param [_index] Value corresponding to the index of the array that must be ignored (optional, default is 0).
/// @returns {real} The index of the clicked button or -1 if no button was clicked.
function buttons_data_set(_array, _index) {
    var _settings_button_data = [];
	 _index ??= 0; // Use the nullish coalescing operator to assign 0 if _index is null or undefined
    // Data of coords buttons
    for (var _Bup = 0; _Bup < array_length(_array); _Bup++) {
        var _btn_info = _array[_Bup];
        var _btn_x = _btn_info[1];
        var _btn_y = _btn_info[2];
        var _btn_width = sprite_get_width(_btn_info[0]) * _btn_info[3];
        var _btn_height = sprite_get_height(_btn_info[0]) * _btn_info[4];

        _settings_button_data[_Bup -_index] = [_btn_x, _btn_y, _btn_x + _btn_width, _btn_y + _btn_height];
    }

    // Check for button click
    if (mouse_check_button_pressed(mb_left)) {
        var _clicked_button = -1; // Initialize clicked_button to -1 (no button clicked)

        // Loop through the button data to find which button was clicked
        for (var _i = 0; _i < array_length(_settings_button_data); _i++) {
            var _btn = _settings_button_data[_i];
            if (point_in_rectangle(mouse_x, mouse_y, _btn[0], _btn[1], _btn[2], _btn[3])) {
                _clicked_button = _i;
                break;
            }
        }
        return _clicked_button;
    }

    // Return -1 if no button was clicked
    return -1;
}




