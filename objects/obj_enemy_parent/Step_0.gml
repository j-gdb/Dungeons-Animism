/*if (distance_to_object(obj_skeleton) < 320 and seen == false){
	dir = point_direction(x,y,obj_skeleton.x, obj_skeleton.y)
	for (var rays = 0; rays < ray_count; rays++){
		for (var lines = 0; lines < line_length; lines++){
			var xx = x+lengthdir_x(lines, dir)
			var yy = y+lengthdir_y(lines, dir)
			if (position_empty(xx,yy) == false){
				if (instance_place(xx,yy,obj_wall_parent) != noone){
					break
				}
				if (instance_place(xx,yy,obj_skeleton) != noone){
					seen = true
					break
				}
			}
		}
		dir+= (add_angle * rays) * angle_dir
		angle_dir*=-1
	}
}*/
if (seen == true){
	if calc_path_timer-- <= 0
		{
			//reset the timer
			calc_path_timer = calc_path_delay;
			//can a path be made to the sword
			var _chase = mp_grid_path(global.mp_grid, path, x, y, obj_skeleton.x, obj_skeleton.y, true);
			//start path if we can reach the player
			if _chase {
				path_start(path, move_spd, path_action_stop, false);
			}
		}
}