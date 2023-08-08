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

