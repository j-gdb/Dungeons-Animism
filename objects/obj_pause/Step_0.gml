if room != Room1 and !instance_exists(obj_text_box){
	pause_key = keyboard_check_pressed(ord("P"));
	
	if pause_key && global.paused == false {
		global.paused = true;
		instance_create_depth(x, y, -9999, obj_pause_menu);
		audio_pause_sound(snd_ost);
	} else if pause_key && global.paused == true {
		global.paused = false;
		global.full_screen = SET[? "screen"][0];
		instance_destroy(obj_pause_menu);
		audio_resume_sound(snd_ost);
	}
}