/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (timer_wait >=0)
{
	timer_wait -=1;
	image_alpha = 0;
}else
{	
	speed = 10;
	image_alpha = lerp(image_alpha,1,0.2);
	if (y > room_height)
	{
		instance_destroy();
	}
}