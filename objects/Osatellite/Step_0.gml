/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var rotation_speed = 0.3;
image_angle += rotation_speed

if life <= 1
{
	instance_destroy();
	instance_destroy(Ospeak);
	satellite = false;
}

/*
if !instance_exists(Ospeak) and !satellite
{
	show_message("ospeak")
	satellite = true;
	var _inst =instance_create_depth(0,0,-9999,Ospeak);
	_inst.text_id = "SATELLETE";	

}







