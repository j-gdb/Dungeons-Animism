if room != (room_init || Room1) { 
	if (instance_exists(obj_sword)){
		follow = obj_sword
	}
	else if (instance_exists(obj_skeleton)){
		follow = obj_skeleton
	}
	else{
		follow = obj_shrine
	}
	if (follow != noone){
		xTo = follow.x
		yTo = follow.y
	}
	
	var _cam_X = xTo - view_width/2;
	var _cam_Y = yTo - view_height/2;
	
	_cam_X = clamp(_cam_X, 0, room_width - view_width);
	_cam_Y = clamp(_cam_Y, 0, room_height - view_height);
	
	final_cam_X += (_cam_X - final_cam_X) * .25;
	final_cam_Y += (_cam_Y - final_cam_Y) * .25;
	
	var shake = power(shake_value,2) * shake_power
	final_cam_X += random_range(-shake, shake)
	final_cam_Y += random_range(-shake, shake)
	
	camera_set_view_pos(view_camera[0], final_cam_X, final_cam_Y);
	camera_set_view_angle(view_camera[0], random_range(-shake, shake) * 0.5)
}