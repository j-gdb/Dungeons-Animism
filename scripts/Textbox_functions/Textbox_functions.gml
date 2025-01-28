function scr_set_defaults_for_text()
		{
			line_break_pos[ 0, page_number ] = 999;
			line_break_num[page_number] = 0;
			line_break_offset[page_number] = 0;
			
			//Textbox sprite
			txtb_spr[page_number] = spr_text_box;
		}

/// @param text
/// @param speaker
function scr_text(_text)
		{
			scr_set_defaults_for_text();
			text[page_number] = _text;
			page_number++;
		}

/// @param text_id
function create_textbox ( _text_id )
		{
			with ( instance_create_depth( 0, 0, -9999, obj_text_box) )
					{
						scr_game_text(_text_id);
					}
		}
		
/// @param text_id
function scr_game_text( _text_id )
		{
			switch ( _text_id ) {
				
				
				//----------------------------------NPC DIALOGUE----------------------------------//
				
				case "Test" :
				scr_text("This is a test aaaaaa aaaa aaaa aa AAA aaa a a a asadasdasd asd as da sdasd asdas das dasd asdasasdasdasd adasdas");
				scr_text("Second page of text ASDAsDJsa das djasdjasjd asjdas djd asjd asjf jf asjdf sjf");
				break;
			}
		}