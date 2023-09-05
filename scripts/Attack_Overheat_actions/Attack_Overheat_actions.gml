// Descrição: Este script contém as ações relacionadas aos ataques sobreaquecidos do jogador.
function scr_overheat_cinetic_default()
{
var num_projectiles = ammo;
var projectile_offset_x = 15; // Ajuste conforme necessário
var projectile_offset_y = -10; // Ajuste conforme necessário
var angle_offset = 60; // Ajuste conforme necessário

for (var i = 0; i < num_projectiles; i++)
{
    var offset_angle = i % 2 == 0 ? angle_offset : -angle_offset;
    createProjectile(projectile_offset_x, projectile_offset_y, offset_angle,c_red,-8);
}


	angle_offset = 60
	projectile_offset_x = -45; // Ajuste conforme necessário
	projectile_offset_y = 20; // Ajuste conforme necessário
	 for (var i = 0; i < num_projectiles; i++)
	{
	    var offset_angle = i % 2 == 0 ? angle_offset : -angle_offset;
	    createProjectile(projectile_offset_x, projectile_offset_y, offset_angle,c_red,-8);
	
	
}

    // Gere um tom aleatório para o efeito sonoro de tiro
    var _random_pitch = random_range(0.8, 1.2);
    // Toque o efeito sonoro de tiro com o tom aleatório
    audio_play_sound(snd_bullet01, 0, false);
    audio_sound_pitch(snd_bullet01, _random_pitch);

    // Defina shoot_on como falso, presumivelmente para evitar tiros rápidos
    shoot_on = false;

}

function scr_overheat_missile_default()
{
	// creates a normal machine gun attack
	
	if (alarm[2] == -1) {
		scr_normal_cinetic_default();
	    alarm[2] = 30;  // Set the alarm to 30 steps (or any other desired value)
	   
		
	        var _inst = instance_create_layer(x, y, "Instances", O_missile);
	        _inst.speed = -6;
	        _inst.direction = direction;
	        _inst.image_angle = direction;

	        var _random_pitch = random_range(0.8, 1.0);  // Adjust the pitch range as needed
	        audio_sound_pitch(snd_missile_launcher, _random_pitch);
	        audio_play_sound(snd_missile_launcher, 0, false);
	}
    shoot_on = false;
}

  