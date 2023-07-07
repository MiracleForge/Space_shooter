

//hover
if ( time < duration) { 
	
	hover = ease_in_and_out(time, start, dest - start, duration);
	time++;
	}
else { 
	
	var tempStart = start;
	start = dest;
	dest = tempStart;
	time = 0;
	}
	
	

// glow
if ( time2 < duration2) { 
	
	glow = ease_in_and_out(time2, start2, dest2 - start2, duration2);
	time2++;
	}
else { 
	
	var tempStart = start2;
	start2 = dest2;
	dest2 = tempStart;
	time2 = 0;
	}
	
image_alpha =  0.8 - (glow/100);
image_xscale = 1   - (glow/100);
image_yscale = 1   - (glow/100);

//zoomtimer --;
timertodestroy --;
if (timertodestroy <=0)
{	
	instance_destroy();	
}


if instance_exists(O_boss_beholder) and O_boss_beholder.movState == BOSSmov_state.intro and !capitao
{
	capitao = true;
	var _inst =instance_create_depth(0,0,-9999,Ospeak);
	_inst.text_id = "Capitao";
	
	
	
}