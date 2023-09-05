//Descrição: Este script contém as ações relacionadas aos ataques normais do jogador.
// secondary function
function createProjectile(offset_x, offset_y, angle_offset,proj_blend,veloc)
{
    var angle = direction + angle_offset;
    var proj_x = x + offset_x * cos(degtorad(angle));
    var proj_y = y + offset_y * sin(degtorad(angle));
    var proj = instance_create_layer(proj_x, proj_y, "Instances", Omachinegun);
    
    proj.speed = veloc;
    proj.direction = direction;
    proj.image_angle = direction;
	proj.image_blend = proj_blend;
}
#region//default functions
function scr_normal_missile_default()
{	
if alarm[2] == -1 {
  if alarm[2] == -1 {
    // Configuração comum para todas as instâncias
    var _speed = -5;
    var angle = direction;
    var _image_angle = direction;

    // Número de instâncias a serem criadas
    var num_instances = 2;

    // Loop para criar as instâncias
    repeat (num_instances) {
        // Criação da instância do míssil
        var _miss = instance_create_layer(x + choose(-20, 0, 20), y, "Instances", O_missile);
        _miss.speed = _speed;
        _miss.direction = angle + choose(-15, 0, 15);
        _miss.image_angle = _image_angle;

        // Cria a instância da metralhadora
        var _inst1 = instance_create_layer(x, y, "Instances", Omachinegun);
        _inst1.speed = -6;
        _inst1.direction = angle;
        _inst1.image_xscale = 4;
        _inst1.image_yscale = 4;
        _inst1.image_angle = _image_angle;
        _inst1.image_blend = c_yellow;
    }

    // Gere um tom aleatório para o efeito sonoro de tiro
    var _random_pitch = random_range(0.8, 1.2);
    // Toque o efeito sonoro de tiro com o tom aleatório
    audio_play_sound(snd_bullet01, 0, false);
    audio_sound_pitch(snd_bullet01, _random_pitch);
}

alarm[2] = 45;
	}
	
}
function scr_normal_cinetic_default()
{
		
    var num_projectiles = ammo;
    var projectile_offset_x = 15; // Ajuste conforme necessário
    var projectile_offset_y = -10; // Ajuste conforme necessário
    var angle_offset = 60; // Ajuste conforme necessário
	var heatcolor = overheat ? c_red : image_blend
	var veloc = overheat ? -6 : -8
    for (var i = 0; i < num_projectiles; i++)
    {
        var offset_angle = i % 2 == 0 ? angle_offset : -angle_offset;
        createProjectile(projectile_offset_x, projectile_offset_y, offset_angle,heatcolor,veloc);
    }

    // Gere um tom aleatório para o efeito sonoro de tiro
    var _random_pitch = random_range(0.8, 1.2);
    // Toque o efeito sonoro de tiro com o tom aleatório
    audio_play_sound(snd_bullet01, 0, false);
    audio_sound_pitch(snd_bullet01, _random_pitch);

    // Defina shoot_on como falso, presumivelmente para evitar tiros rápidos
    shoot_on = false;
}
#endregion




