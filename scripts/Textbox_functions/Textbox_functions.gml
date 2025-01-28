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
				
				
				//----------------------------------TEXT----------------------------------//
				
				case "First room" :
				scr_text("These adventurers have entered your dungeon. It is time for you to escape.");
				scr_text("In the top left is your health bar. It will drain over time, but you will recover health when you kill an enemy.");
				scr_text("Kill them and possess them. Make your escape now.");
				break;
				
				case "Shards" :
				scr_text("Enemies outlined in red hold shards they have looted. Collect all the shards to open the path to exit.");
				break;
				
				case "Shields" :
				scr_text("Some enemies carry shields. They will block your attacks, but get destroyed after a hit.");
			}
		}