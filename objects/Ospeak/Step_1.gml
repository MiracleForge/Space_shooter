/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var _s = id;


if instance_exists(O_boss_beholder) and O_boss_beholder.movState == BOSSmov_state.intro  and text_draw = false
{
text_draw =true;
	
	 scr_create_text_id(text_id,0);
}
if instance_exists(OaideShip)and OaideShip.aideship and !text_draw
{
text_draw =true;
	
	 scr_create_text_id(text_id,1);
}
if room == rm_Hightspeed and !text_draw
{
text_draw =true;
	
	 scr_create_text_id(text_id,0);
}
// if (instance_exists(Osatellite)) and !text_draw
  //  {
		
     //   text_draw = true;
      //  scr_create_text_id(text_id, 0);
  //  }
//
 


