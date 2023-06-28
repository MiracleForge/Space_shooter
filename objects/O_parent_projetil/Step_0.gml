/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
//If the projectile goes beyond the camera bounds, destroy projectile.
/*
var cameraLeft = camera_get_view_x(view_camera[0]);
var cameraRight = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]);
var cameraTop = camera_get_view_y(view_camera[0]);
var cameraBottom = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]);

if (x < cameraLeft || x > cameraRight || y < cameraTop || y > cameraBottom)
{
    instance_destroy(self);  
	
}