/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// resolution and scale
/*
resolution_width = 720;
resolution_height = 1080;
resolution_scale = 4;

global.view_width = resolution_width / resolution_scale;
global.view_height = resolution_height / resolution_scale;

//draw surface and windows size
window_set_size(global.view_width * resolution_scale, global.view_height * resolution_scale);
surface_resize(application_surface,global.view_width * resolution_scale, global.view_height * resolution_scale);

//follow camera
view_target = Oplayer_space_ship01;
view_speed = 0.1; // max - less == 0.09, etc etc ;

//gui draw size
display_set_gui_size(global.view_width, global.view_height);