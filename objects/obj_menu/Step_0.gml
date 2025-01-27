//get inputs
down_key = keyboard_check_released(vk_down) + keyboard_check_pressed(ord("S"));
up_key = keyboard_check_pressed(vk_up) + keyboard_check_pressed(ord("W"));
left_key = keyboard_check_pressed(vk_left) + keyboard_check_pressed(ord("A"));
right_key = keyboard_check_pressed(vk_right) + keyboard_check_pressed(ord("D"));
accept_key = keyboard_check_pressed(vk_space);

//store number of options in current menu
op_length = array_length(option[menu_level]);
//move through the menu
pos += down_key - up_key;
h_pos = right_key - left_key;
//Loop through the menu
if pos >= op_length { pos = 0 };
if pos < 0 { pos = op_length - 1 };

//use the options
function process_menu() {
	if accept_key || (is_array(option[menu_level][pos]) && (h_pos != 0)) {
	
	var _start_menu_level = menu_level;
		
	switch(menu_level) {
		//Starting menu
		case MAIN:
			switch(pos) {
				//Play
				case 0:
					room_goto_next();
					break;
				//Settings
				case 1:
					menu_level =  SETTINGS; 
					break;
				//Exit
				case 2:
					game_end();
					break;
				}
			break;
		//Settings menu
		case SETTINGS:
			switch(pos) {
				//Back
				case 0:
					menu_level = MAIN; 
					
					break;
				//Sound
				case 1: 
					menu_level = SOUND;
					break;
				//Video
				case 2:
					menu_level = VIDEO;
					break;
			}
		break;
			
		//Sound menu
		case SOUND:
			switch(pos) {
				//Back
				case 0: 
					menu_level = SETTINGS; 
					break;
				//SFX
				case 1: 
					change_menu(h_pos, "sfx"); 
					break;
				//Music
				case 2: 
					change_menu(h_pos, "music");
					break;
			}
		break;
		
		//Video menu
		case VIDEO:
			switch(pos) {
				//Back
				case 0:
					menu_level = SETTINGS;
					break;
				//Full Screen
				case 1:
				change_menu(h_pos, "screen");
				window_set_fullscreen(SET[? "screen"][0]); 
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

function change_menu(_move, _key) {
	//@desc		change the ds map key entry by the move value passed
	//@_move		real			which way to move the selection
	//@_key			string			ds_map key for this selection
	
	//get the allowed limits for this selection
	//get map array
	var _map_arr = SET[? _key];
	//get the limits array
	var _limits_arr = _map_arr[1];
	
	//is the first entry in the limits an integer?
	if is_real(_limits_arr[0]) {
		//limits are index position 0 and 1
		limit_min = _limits_arr[0];
		limit_max = _limits_arr[1];
	} else {
		//string entries, limits are 0 and the size of the array -1
		limit_min = 0;
		limit_max = array_length(_limits_arr) - 1;
	}
	//move the selection
	_map_arr[@ 0]  = clamp(_move + _map_arr[0], limit_min, limit_max);
}