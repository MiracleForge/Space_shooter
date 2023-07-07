/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
accept_key  = keyboard_check_pressed(ord("P"));
textbox_x = camera_get_view_x(view_camera[0]);
textbox_y = camera_get_view_y(view_camera[0]);


if (!setup) {
    setup = true;
    draw_set_font(Font_score);
    draw_set_valign(fa_top);
    draw_set_halign(fa_left);

    // loop through pages
    for (var p = 0; p < page_number; p++) {
		// salva a quantidade de caracteres da pagina e armazena no array
        text_length[p] = string_length(text[p]);
		
		// get the x position of text box 
			//no character talking , center text box
		text_x_offset[p] = room_width/4;
    }
}

if draw_char < text_length[page]
{
	draw_char += text_speed;
	draw_char = clamp(draw_char,0,text_length[page]);
	
}

//flip to pages
if draw_char >= text_length[page]
{
    if page < page_number - 1
    {
        page++;
        draw_char = 0;
    }
    else
    {
		
        instance_destroy();
    }
}


if instance_exists(Ospeak)
{
	//draw the textbox
	txtb_img += txtb_img_spd;
	var txtb_spr_w = sprite_get_width(txtb_spr);
	var txtb_spr_h = sprite_get_height(txtb_spr);

	// draw_back of text BOX
	draw_sprite_ext(txtb_spr,txtb_img,textbox_x + text_x_offset[page] ,
	textbox_y + room_height/2, textbox_width/txtb_spr_w,textbox_height/txtb_spr_h,0,c_white,1);

	//draw the text
	var _drawtext = string_copy(text[page],1,draw_char);
	draw_text_ext(textbox_x + text_x_offset[page] + border,textbox_y + border + (room_height/2 - 20), _drawtext, line_sep,line_width);

	// draw_characterBOX
	draw_sprite_ext(spr_HUI_rectangle,0,room_width/2,room_height/1.5, 6,6,0,c_white,1)
	// draw_ icon character
	
	if !is_undefined(Ospeak.spriteicon)
	{
		image_speed = 0.1;
		draw_sprite_ext(Ospeak.spriteicon,image_index,room_width/2 + 5,room_height/1.5 + 6,10,10,0,c_white,1);	
	}
	
}



