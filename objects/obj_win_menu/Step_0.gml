//get inputs
accept_key = keyboard_check_pressed(vk_space);

//store number of options in current menu
op_length = array_length(option[menu_level]);

//use the options
function process_menu() {
	if accept_key || (is_array(option[menu_level][pos]) && (h_pos != 0)) {
	
	var _start_menu_level = menu_level;
		
	switch(menu_level) {
		//Starting menu
		case MAIN:
			switch(pos) {
				//Continue
				case 0:
					global.paused = false;
					room_goto(Room1);
					instance_destroy();
					break;
			}
		}
	//set position back
	if _start_menu_level != menu_level {pos = 0};
	//correct option length
	op_length = array_length(option[menu_level]);
	}
}
process_menu();