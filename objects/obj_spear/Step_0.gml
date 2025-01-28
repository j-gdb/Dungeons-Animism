image_angle = angle
if global.paused == false {
	x+=lengthdir_x(5,angle)
	y+=lengthdir_y(5,angle)
}

/*var _owner = instance_nearest(x, y, obj_soldier);

if (instance_exists(_owner)){
	if place_meeting(x, y, obj_skeleton) && _owner.attack == true && global.can_hit == true{
		attack_delay = attack_timer;
		global.current_hp -= 15;
	} 
	else {
		attack_delay--;
		if attack_delay < 0 {
			attack_delay = 0;
		}
	}
}
else{
	instance_destroy()
}*/