pause_key = keyboard_check_pressed(ord("P"));

if pause_key && global.paused == false {
	global.paused = true;
} else if pause_key && global.paused == true {
	global.paused = false;
}