/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if instance_exists(O_player_parent)
{
if isfragmented {
    repeat(2) {
        var _frag = instance_copy(self); 

        // Defina a direção de cada fragmento de forma diferente
        _frag.direction = direction + random_range(-45, 45); // Por exemplo, adicione uma direção aleatória entre -45 e 45 graus à direção original
        _frag.image_angle = direction + random_range(-25, 25);
        _frag.isfragmented = false; // Bloqueie a fragmentação
        _frag.bullet_name = 0;  // Outros efeitos em inimigos
        _frag.image_xscale = 2.5;
        _frag.image_yscale = 2.5;  
    }
    instance_destroy();
}

if O_player_parent.overheat and tiny_frag_canfragment {
    repeat(2) {
        var _frag = instance_copy(self); 

        // Defina a direção de cada fragmento na direção oposta à cópia original
        _frag.direction = direction + random_range(-45, 45); // Inverte a direção
        _frag.image_angle =  direction + random_range(-25, 25); // Inverte a direção da imagem
        _frag.isfragmented = false; // Bloqueie a fragmentação
        _frag.bullet_name = 0;  // Outros efeitos em inimigos
        _frag.image_xscale = 1.5;
        _frag.image_yscale = 1.5; 
		_frag.speed = -6;
    }
    instance_destroy();
}
}
















