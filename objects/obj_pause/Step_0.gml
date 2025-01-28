if room != Room1 {
	pause_key = keyboard_check_pressed(ord("P"));
	
	if pause_key && global.paused == false {
		global.paused = true;
		instance_create_depth(x, y, -9999, obj_pause_menu);
	} else if pause_key && global.paused == true {
		global.paused = false;
		global.full_screen = SET[? "screen"][0];
		instance_destroy(obj_pause_menu);
	}
}