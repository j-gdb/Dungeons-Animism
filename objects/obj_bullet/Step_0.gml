if global.paused == false {
	motion_set(dir, 5)
} else {
	motion_set(dir, 0)
}
if (global.current_hp <= 0){
	instance_destroy()
}