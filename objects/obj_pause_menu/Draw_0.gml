draw_set_font(fnt_text)
for	(var i = 0; i < op_length; i++)
{
	//reset color
	var _c = c_white
	if pos == i { _c = c_yellow };
	//is this a selectable menu item , or just plain text?
	if is_array(option[menu_level][i]) {
		//store the menu array
		var _menu_arr = option[menu_level][i];
		//get the map array
		var _map_arr = SET [? _menu_arr[1]];
		//get the limit array, or choices array
		var _limits_arr = _map_arr[1];
		//does it display an integer or text?
		str1 = _menu_arr[0];
		if is_real(_limits_arr[0]) {
				//integer to show
				str2 = string(_map_arr[0]);
		} else {
			//string to show
			str2= _limits_arr[_map_arr[0]];
		}
	} else {
		//draw string
		str1 = option[menu_level][i];
		str2 = "";
	}
	//set up y position and text width
	//get the struct for this menu entry
	var _stc = button_arr[menu_level][i];
	_stc.y = menu_y_pos + op_space * i;
	
	//set the different widths if we are on an array
	if str2 == "" {
		_stc.wl = string_width(str1)/2; 
		_stc.wr = string_width(str1)/2; 
	} else {
		_stc.wl = string_width(str1 + " ");
		_stc.wr = string_width(str2 + " ");
	}
	//is the mouse hovering over a menu entry
	var _hovering_over_text = false;
	//should the mouse control the menu?
	if mouse_y >= menu_y_pos && mouse_y <= menu_y_pos + (op_space * op_length) {
		//check which menu entry we are over
		if mouse_y > _stc.y && mouse_y < _stc.y + _stc.h {
			//check x position
			if mouse_x > menu_x_pos - _stc.wl && mouse_x < menu_x_pos + _stc.wr {
				_c = c_yellow;
				_hovering_over_text = true;
			}
		}
	}
	//is this the current index? if so hightlight it
	if pos == i _c = c_yellow;
	//update the index with the mouse position if this is the selected text
	if _c = c_yellow {
		//update the index
		pos = i;
		//are we clicking the entry and is it over the text?
		if mouse_check_button_pressed(mb_left) && _hovering_over_text {
			//set the menu select to true
			accept_key = 1;
			h_pos = 0;
			//if menu entry is an array, allow movement
			if is_array(option[menu_level][i]) {
				//increment the array depending on where we click
				if mouse_x < menu_x_pos - _stc.wl + click_area_w {
					h_pos = -1; 
					} else if mouse_x > menu_x_pos - click_area_w && mouse_x < menu_x_pos {
						h_pos = 1;
					}		
			}
			
			process_menu();		
			//update size as we could be in a new submenu
			op_length = array_length(option[menu_level]);
		}
	}
	//draw the text
	if str2 == "" {
		//simple entry
		draw_set_halign(fa_center);
		draw_text_color(menu_x_pos, menu_y_pos + op_space*i, str1 + " ", _c, _c, _c, _c, 1);
	} else {
		//array entry
		draw_set_halign(fa_right);
		draw_text_color(menu_x_pos, menu_y_pos + op_space*i, str1 + " ", _c, _c, _c, _c, 1);
		draw_set_halign(fa_left);
		draw_text_color(menu_x_pos, menu_y_pos + op_space*i, " " + str2, _c, _c, _c, _c, 1);
	}
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);