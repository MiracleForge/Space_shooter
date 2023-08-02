/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

#region //orbiting
// Find out the location of the orbiting object and save it in orbit_x and orbit_y.
/*
if check 

{
orbit_dir += orbit_speed;

// Calculate the new position of "Obuttonmoon" using trigonometry
x = grav_center_x + orbit_distance * cos(degtorad(orbit_dir));
y = grav_center_y + orbit_distance * sin(degtorad(orbit_dir));
}
*/
#endregion
var scale_speed = 0.2

if (planet_id == id) {
  // Se o planeta atual for o planeta desejado, aumente gradualmente a escala.
  if (image_xscale < 3) {
    image_xscale += scale_speed
  }
  if (image_yscale < 3) {
    image_yscale += scale_speed
  }
  
}else
{	
	image_yscale = planet_scale;
	image_xscale = planet_scale;
}









