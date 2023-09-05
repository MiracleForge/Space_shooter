/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
//player's End Step
if allow_damage and alarm[1] == -1 {
    show_debug_message("place_meeting")
    var _inst_collid_with = place_meeting(x, y, O_parent_colition_with_player);
    if (_inst_collid_with != noone) {
        var _list = ds_list_create();
        var _num = instance_place_list(x, y, O_parent_colition_with_player, _list, false);
        if (_num > 0) {
            show_debug_message("travou no num > 0")
            for (var i = 0; i < _num; ++i) {
                var object_we_collide_with = ds_list_find_value(_list, i);
                var collision_type = object_we_collide_with.collision_type;

                switch (collision_type) {
                    case 1:
                        current_life = 0; // kill player
                        Ogame.alarm[0] = 120; // restart room
                        break;
                    case 2:
                        alarm[1] = 300;
                        current_life -= 1;
                        break;
                    case 3:
                        instance_destroy(object_we_collide_with);
                        alarm[1] = 300;
                        current_life -= 1;
                        break;
                }
            }
        }
        ds_list_destroy(_list);
    }
}

/*
if allow_damage and alarm[1] == -1{
	show_debug_message("place_meeting")
	var _inst_collid_with = (place_meeting(x, y, O_parent_colition_with_player));
	if (_inst_collid_with != noone) { //one parent for all objects that can collide with player
	    var _list = ds_list_create();
	    var _num = instance_place_list(x, y, O_parent_colition_with_player, _list, false);
			var _detect_collision = false;
	    if (_num > 0)  {
			show_debug_message("travou no num > 0")
	        for (var i = 0; i < 1; ++i;) {
	            var object_we_collide_with = ds_list_find_value(_list, i);
	            //each object has hit_type variable to make it faster to check what kind of object is this
         
	            switch (object_we_collide_with.collision_type) { 
					//collision_type: 1=gameover, 2=ships, 3=normal bullets, 4=slowbullets, 5 =explosions .
				   case 1:
						current_life = 0; // kill player
						Ogame.alarm[0] =	120; // restart room
				   break;
				   case 2 : 
						 alarm[1] = 300;
						current_life -= 1;	
				   break;
	               case 3 : // bullets 
						 instance_destroy(object_we_collide_with);
						 alarm[1] = 300;
						current_life -= 1;	
						
				   break;
				   
				   
	            }
	        }
	    }
      ds_list_destroy(_list);	   
	}
}














