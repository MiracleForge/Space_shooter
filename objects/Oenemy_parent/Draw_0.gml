/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_text(x- 40, y , id)
if flash_t > 0
{
	gpu_set_fog(true,c_white,0,0);
	flash_t --;
}
draw_self();
gpu_set_fog(false,c_white,0,0);














