/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
unblock();
 if skill_dad == noone and  boss_defeated 
 {
	
 }

if (lock_skill ==  false and sprite_index = Spr_boss_speed   and !bonusapply)
{
	bonusapply = true;
	global.speedo += 0.5;
	}else if (lock_skill ==  false and sprite_index = Spr_armor_icon  and !bonusapply)
	{
		bonusapply = true;
		global.armor += 1;	
		}else if (lock_skill ==  false and sprite_index = Spr_boss_escudo and !bonusapply)
		{
			bonusapply = true;
			global.shield += 5;
		}else if (lock_skill ==  false and sprite_index = Spr_boss_mira  and !bonusapply)
		{
		bonusapply = true;
		global.attack += 1;
		}









