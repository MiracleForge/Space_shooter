/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var mouse_dragging = true;
var drag_start_y = mouse_y;
var max_scrollpos = is_showing_pilots ? ((number_of_pilots - 3) * -200) : ((number_of_ships - 3) * -200)
if ( mouse_y > 571 and mouse_check_button_pressed(mb_left) ){
    mouse_yprevious = mouse_y;
}

if ( mouse_y > 571 and mouse_check_button(mb_left) and !confirm_buy)  {
    var mouse_y_change = mouse_y - mouse_yprevious;
    if (mouse_y_change > 0 and scrollpos <= 20) {
        // Arrastar para baixo
        scrollpos += 5;
    } else if (mouse_y_change < 0 and scrollpos >= max_scrollpos) {
        // Arrastar para cima
        scrollpos -= 5;
    }
    mouse_yprevious = mouse_y;
}















