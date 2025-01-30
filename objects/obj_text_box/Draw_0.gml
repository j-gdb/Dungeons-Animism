draw_set_font(fnt_textbox)
if delay <= 0 {
	key_accept = keyboard_check_pressed(vk_space);
	click = mouse_check_button_pressed(mb_left);

	text_box_x = camera_get_view_x(view_camera[0]);
	text_box_y = camera_get_view_y(view_camera[0]) + 320;

	//setup
	if setup == false
		{
			setup = true;
			draw_set_color(c_white)
			//draw_set_font(font goes here);
			draw_set_valign(fa_top);
			draw_set_halign(fa_left);
		
			//Loop through the pages
			for (var p = 0; p < page_number; ++p) {
				//find how many characters are on each page and store that number in the "text_lenght" array
			    text_lenght[p] = string_length(text[p]);
			
				//get the X position for the text box
			
					//center the text box
						text_x_offset[p] = 80;
						line_width = text_box_width - (border*2);
			
				//Setting individual characters and finding where the lines of text should break
				for (var c = 0; c < text_lenght[p]; ++c) 
					{
						var _char_pos = c+1;
					
						//store individual characters into the "char" array
						char[ c, p ] = string_char_at(text[p], _char_pos);
					
						//get current width of the line
						var _text_up_to_char = string_copy(text[p], 1, _char_pos);
						var _current_text_w = string_width(_text_up_to_char) - string_width(char[c, p]);
					
						//get the last free space
						if char[c , p] == " " { last_free_space = _char_pos + 1 };
					
						//get the line breaks 
						if _current_text_w - line_break_offset[p] > line_width
								{
									line_break_pos[ line_break_num[p], p ] = last_free_space;
									line_break_num[p]++;
									var _text_up_to_last_space = string_copy(text[p], 1, last_free_space);
									var _last_free_space_string = string_char_at(text[p], last_free_space);
									line_break_offset[p] = string_width(_text_up_to_last_space) - string_width(_last_free_space_string);
								}
					}
			
				//getting each characters coordinates
				for (var c = 0; c < text_lenght[p]; ++c) {
				    var _char_pos = c+1;
					var _text_x = text_box_x + text_x_offset[p] + border;
					var _text_y = text_box_y + border;
						
					//get current width of the line
					var _text_up_to_char = string_copy(text[p], 1, _char_pos);
					var _current_text_w = string_width(_text_up_to_char) - string_width(char[c, p]);
					var _text_line = 0;
				
					//compensate for string breaks
					for (var lb = 0; lb < line_break_num[p]; ++lb) 
						{
						    //if the current looping character is after a line break
							if _char_pos >= line_break_pos[lb, p]
									{
										var _str_copy = string_copy(text[p], line_break_pos[lb, p], _char_pos - line_break_pos[lb, p]);
										_current_text_w = string_width(_str_copy);
									
										//record the line this character should be on
										_text_line = lb+1;
									}
						}
				
					//add the X and Y coordinates based on the new info
					char_x[ c, p] = _text_x + _current_text_w;
					char_y[ c, p] = _text_y + _text_line*line_sep;
				}
			}
		}

	//typing the text
	if draw_char < text_lenght[page]
		{
			draw_char += text_spd;
			draw_char = clamp(draw_char, 0, text_lenght[page]);
		}
	
	//------------------flip through pages------------------//
	if key_accept || click
		{
				//if the typing is done go to the next page
				if draw_char == text_lenght[page]
					{
							//next page  (the -1 is there bc page_number is returning an array lenght value which starts at 0)
							if page < page_number - 1
								{
									page++;
									draw_char = 0;
								}
							//destroy the text box
							else { 
										instance_destroy(); 
										global.paused = false; 
								}
					}
				//if not done typing
				else
					{ draw_char = text_lenght[page]; }
		}

	//------------------DRAW THE TEXT BOX------------------//
	var _txtb_x = text_box_x + text_x_offset[page];
	var _txtb_y = text_box_y;
		txtb_img += txtb_img_spd;
		txtb_spr_w = sprite_get_width(txtb_spr[page]);
		txtb_spr_h = sprite_get_height(txtb_spr[page]);

		//back of the text box
		draw_sprite_ext(txtb_spr[page], txtb_img, _txtb_x, _txtb_y, text_box_width/txtb_spr_w, text_box_height/txtb_spr_h, 0, c_white, 1);
	
	
		//------------------Draw the text------------------//
		//draw_set_font(font goes here);
		for (var c = 0; c < draw_char; ++c) 
			{
			    //The text
				draw_text( char_x[ c, page], char_y[ c, page], char[ c, page]);
			}
		

	//draw_set_font(set to the default font);
}
