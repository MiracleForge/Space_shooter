/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var _ship = O_player_parent;
if _ship.shield_active and _ship.shield >0 and O_enemy_mine.explosion_range == true 
{
	_ship.shield -=1;
	visible = true;
    alarm[0]= 180;
O_enemy_mine.explosion_range = true; // detonação por aproximação
}
