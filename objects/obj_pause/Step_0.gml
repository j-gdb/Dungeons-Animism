if room != Room1 and !instance_exists(obj_text_box){
	pause_key = keyboard_check_pressed(ord("P"));
	
	if pause_key && global.paused == false {
		global.paused = true;
		instance_create_depth(x, y, -9999, obj_pause_menu);
		audio_pause_sound(snd_ost);
	} else if pause_key && global.paused == true {
		global.paused = false;
		global.full_screen = SET[? "screen"][0];
		global.sound = SET[? "sfx"][0];
		global.music = SET[? "music"][0];
		instance_destroy(obj_pause_menu);
		audio_resume_sound(snd_ost);
	}
}

if ( browser_width != bw || browser_height != bh )
	{
		bw = browser_width;
		bh = browser_height;
		window_set_size(bw, bh);
		window_center();
	}
	