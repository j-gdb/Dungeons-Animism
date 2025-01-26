image_angle = angle
x+=lengthdir_x(5,angle)
y+=lengthdir_y(5,angle)

var _owner = instance_nearest(x, y, obj_soldier);

if place_meeting(x, y, obj_skeleton) && _owner.attack == true && attack_delay = 0{
	attack_delay = attack_timer;
	global.current_hp -= 15;
} else {
	attack_delay--;
	if attack_delay < 0 {
		attack_delay = 0;
	}
}