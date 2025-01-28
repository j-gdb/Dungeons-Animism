if global.paused == false {
	//enemy ray cast to see player
	if (distance_to_object(obj_skeleton) < active_distance and seen == false){
		dir = point_direction(x,y,obj_skeleton.x, obj_skeleton.y)
		for (var rays = 1; rays <= ray_count; rays++){
			for (var lines = 0; lines < line_length; lines+=8){
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
	}
	if (seen == true){
		if calc_path_timer-- <= 0
			{
				//reset the timer
				calc_path_timer = irandom_range(10,30)//calc_path_delay;
				//can a path be made to the sword
				var _chase = mp_grid_path(global.mp_grid, path, x, y, obj_skeleton.x, obj_skeleton.y, true);
				//start path if we can reach the player
				if _chase {
					path_start(path, move_spd, path_action_stop, false);
				}
			}
	}
	//wandering
	else if (seen == false){
		//randomly choose if they can wander
		if (can_wander < 90){
			if (alarm[10] <= 0){
				alarm[10] = irandom_range(60, 300)
			} 
		}
		else{
			if (can_wander <= 100){
				var node = irandom_range(1, instance_number(obj_node))
				var node_id = nth_nearest(x,y,obj_node, node)
				repeat(15){
					new_x = node_id.x + irandom_range(-wander_distance,wander_distance)
					new_y = node_id.y + irandom_range(-wander_distance,wander_distance)
					if (place_empty(new_x, new_x, [obj_wall_parent, obj_enemy_parent]) and 0 <= new_x and new_x <= room_width and 0 <= new_y and new_y <= room_height){
						if (collision_circle(new_x, new_y, 32, obj_wall_parent, false, false) == noone){
							var _chase = mp_grid_path(global.mp_grid, path, x, y, new_x, new_y, true);
							if _chase{
								path_start(path, 1, path_action_stop, true)
							}
							alarm[11] = 60 //should have made it to the spot
							can_wander = 101 //lets not try to wander for now
							break
						}
					}
				}
			}
		}
	}
}