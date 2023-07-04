/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


var _w = global.res_width;
var _h = global.res_height;
var _cam = camera_create_view(0, 0, _w, _h);

camera_set_view_target(_cam, cameratarget);
camera_set_view_border(_cam, _w / 2, _h / 2);

room_width = global.res_width;
room_height = global.res_height;

pick_ship = true;
