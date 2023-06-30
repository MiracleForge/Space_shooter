/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Defina a distância mínima de afastamento entre os inimigos
var minimumDistance = 30;

// Verifique a colisão com outros inimigos
with (O_enemy_stalker) {
    // Certifique-se de não comparar com o próprio inimigo
    if (id != other.id) {
        // Calcule a distância entre os inimigos
        var distance = point_distance(x, y, other.x, other.y);

        // Se a distância for menor que a distância mínima, afaste-se
        if (distance < minimumDistance) {
            // Calcule o ângulo entre os inimigos
            var angle = point_direction(x, y, other.x, other.y);

            // Calcule o afastamento com base na distância mínima
            var separation = minimumDistance - distance;

            // Aplique o afastamento para ambos os inimigos
            x += lengthdir_x(separation, angle);
            y += lengthdir_y(separation, angle);
            other.x += lengthdir_x(separation, angle + 180);
            other.y += lengthdir_y(separation, angle + 180);
        }
    }
}