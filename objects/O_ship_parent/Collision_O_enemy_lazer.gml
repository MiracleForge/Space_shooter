/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (shield >= 1)
{
    if (shield_up == true) and shield >=10 {
        alarm[2] = 100;   
        shield_up = false;
        shield -= 10;
    }
}
else 
{	
    if (take_damage == true) {
        alarm[2] = 100;   
        take_damage = false;
        life_ship -= 2;
    }
}
