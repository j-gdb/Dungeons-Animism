//enemy ray cast to see player
if (distance_to_object(obj_skeleton) < active_distance and seen == false){
	dir = point_direction(x,y,obj_skeleton.x, obj_skeleton.y)
	for (var rays = 1; rays <= ray_count; rays++){
		for (var lines = 0; lines < line_length; lines+=8){
			var xx = x+lengthdir_x(lines, dir)
			var yy = y+lengthdir_y(lines, dir)
			if (position_empty(xx,yy) == false){
				//stop rays when hitting a wall
				if (instance_place(xx,yy,obj_wall_parent) != noone){
					break
				}
				//see player
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
if (seen == true and !instance_exists(shield_id)){
	//moving into range to attack
	if (state == 0){
		if calc_path_timer-- <= 0 {
			if (distance_to_object(obj_skeleton) >= 70){
				var found = false //did we find a path
				repeat(15){
					new_x = obj_skeleton.x + 64*irandom_range(-1,1)
					new_y = obj_skeleton.y + 64*irandom_range(-1,1)
					if (place_empty(new_x, new_x, [obj_wall_parent, obj_enemy_parent]) and 0 <= new_x and new_x <= room_width and 0 <= new_y and new_y <= room_height){
						if (collision_circle(new_x, new_y, 32, obj_wall_parent, false, false) == noone){
							var _chase = mp_grid_path(global.mp_grid, path, x, y, new_x, new_y, true);
							if _chase{
								path_start(path, move_spd, path_action_stop, true)
								found = true
							}
							break
						}
					}
				}
				if (found == false){
					var _chase = mp_grid_path(global.mp_grid, path, x, y, obj_skeleton.x, obj_skeleton.y, true);
					//start path if we can reach the player
					if _chase {
						path_start(path, move_spd, path_action_stop, true);
					}
				}
				//reset the timer
				calc_path_timer = irandom_range(10,30)//calc_path_delay;
			}
			else{
				//reset the timer
				calc_path_timer = irandom_range(10,30)//calc_path_delay;
				//can a path be made to the sword
				var _chase = mp_grid_path(global.mp_grid, path, x, y, obj_skeleton.x, obj_skeleton.y, true);
				//start path if we can reach the player
				if _chase {
					path_start(path, move_spd, path_action_stop, true);
				}
			}
		}
		//dodge/run away ish
		if (mouse_check_button_pressed(mb_left) and seen == true and distance_to_object(obj_skeleton) < 200){
			calc_path_timer = irandom_range(10,30)
			var node_id = nth_nearest(x,y,obj_node, 2) //where they move towards
			if (node_id != noone){
				var _chase = mp_grid_path(global.mp_grid, path, x, y, node_id.x, node_id.y, true);
				if _chase {
					path_start(path, move_spd+1, path_action_stop, true);
				}
			}
		}
		//got within range
		if (distance_to_object(obj_skeleton) < 50){
			state = 1
			path_end()
		}
	}
	else if (state == 1){ //attacking
		if (alarm[0] <= 0 and attack == false){
			if (x == xprevious and y == yprevious){
				alarm[0] = irandom_range(5,25)
			}
		}
		if (mouse_check_button_pressed(mb_left) and attack == false){
			alarm[0] = 0
			calc_path_timer = irandom_range(15,30)
			var node_id = nth_nearest(x,y,obj_node, 2) //where they move towards
			if (node_id != noone){
				var _chase = mp_grid_path(global.mp_grid, path, x, y, node_id.x, node_id.y, true);
				if _chase {
					path_start(path, move_spd+1, path_action_stop, true);
				}
			}
		}
		if (distance_to_object(obj_skeleton) > 50){
			state = 0
		}
		
	}
}
else if (seen == true and instance_exists(obj_shield)){
	//moving into range to attack
	if (stop == false){
		if (state == 0){
			if calc_path_timer-- <= 0 {
				if (distance_to_object(obj_skeleton) >= 70){
					var found = false //did we find a path
					repeat(15){
						new_x = obj_skeleton.x + 64*irandom_range(-1,1)
						new_y = obj_skeleton.y + 64*irandom_range(-1,1)
						if (place_empty(new_x, new_x, [obj_wall_parent, obj_enemy_parent]) and 0 <= new_x and new_x <= room_width and 0 <= new_y and new_y <= room_height){
							if (collision_circle(new_x, new_y, 32, obj_wall_parent, false, false) == noone){
								var _chase = mp_grid_path(global.mp_grid, path, x, y, new_x, new_y, true);
								if _chase{
									path_start(path, move_spd, path_action_stop, true)
									found = true
								}
								break
							}
						}
					}
					if (found == false){
						var _chase = mp_grid_path(global.mp_grid, path, x, y, obj_skeleton.x, obj_skeleton.y, true);
						//start path if we can reach the player
						if _chase {
							path_start(path, move_spd, path_action_stop, true);
						}
					}
					//reset the timer
					calc_path_timer = irandom_range(10,30)//calc_path_delay;
				}
				else{
					//reset the timer
					calc_path_timer = irandom_range(10,30)//calc_path_delay;
					//can a path be made to the sword
					var _chase = mp_grid_path(global.mp_grid, path, x, y, obj_skeleton.x, obj_skeleton.y, true);
					//start path if we can reach the player
					if _chase {
						path_start(path, move_spd, path_action_stop, true);
					}
				}
			}
			//got within range
			if (distance_to_object(obj_skeleton) < 50){
				state = 1
				path_end()
			}
		}
		else if (state == 1){ //attacking
			if (alarm[0] <= 0 and attack == false){
				if (x == xprevious and y == yprevious){
					alarm[0] = irandom_range(5,25)
				}
			}
			if (distance_to_object(obj_skeleton) > 50){
				state = 0
			}
		
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