/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_self();

var bar_width = 10; // Largura da barra de vida
var bar_height = 40; // Altura da barra de vida
var bar_offset_x = 15; // Deslocamento horizontal da barra em relação ao sprite
var bar_offset_y = 20; // Deslocamento vertical da barra em relação ao sprite

var x1 = x + sprite_width - bar_offset_x - bar_width;
var y1 = y + sprite_height - bar_offset_y - bar_height;
var x2 = x1 + bar_width;
var y2 = y1 + bar_height;

// Limitar os valores da barra de vida entre 0 e 100 (caso life ou max_life sejam negativos ou maiores que max_life)
var life_percentage = clamp(life / max_life, 0, 1) * 100;

draw_healthbar(x1, y1, x2, y2, life_percentage, c_black, c_red, c_lime, 3, true, true);










