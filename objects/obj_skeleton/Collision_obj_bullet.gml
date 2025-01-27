if (global.can_hit == true){
	global.can_hit = false
	global.current_hp-=15
}
with (other){
	instance_destroy()
}