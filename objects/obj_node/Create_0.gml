if (x <= 0 or x>= room_width or y <= 0 or y >= room_width){
	instance_destroy()
}
if (place_meeting(x,y,obj_wall_parent)){
	instance_destroy()
}