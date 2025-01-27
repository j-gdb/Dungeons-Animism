if (distance_to_object(obj_skeleton) < active_distance and seen == false){
	dir = point_direction(x,y,obj_skeleton.x, obj_skeleton.y)
	for (var rays = 0; rays < ray_count; rays++){
		for (var lines = 0; lines < line_length; lines+=8){
			var xx = x+lengthdir_x(lines, dir)
			var yy = y+lengthdir_y(lines, dir)
			if (position_empty(xx,yy) == false){
				if (instance_place(xx,yy,obj_wall_parent) != noone){
					break
				}
				if (instance_place(xx,yy,obj_skeleton) != noone){
					seen = true
					alarm[0] = 60
					break
				}
			}
		}
		dir+= (add_angle * rays) * angle_dir
		angle_dir*=-1
	}
}
if (seen == true){
	path_end()
	if (state == 1){ //teleport
		repeat(15){
			tele_x = random_range(x-range_teleport, x+range_teleport)
			tele_y = random_range(y-range_teleport, y+range_teleport)
			if (0 < tele_x and tele_x < room_width and  0 < tele_y and tele_y < room_height){
				if (place_empty(tele_x, tele_y, [obj_skeleton, obj_wall_parent, obj_enemy_parent])){
					var range = irandom_range(200,300)
					for (var i = 0; i < range; i++){
						var off_x = random_range(-32,32) //random offset
						var off_y = random_range(-32,32)
						part_particles_create(global.particle_system, x+off_x,y+off_y, particle_teleport, 1)
					}
					x = tele_x
					y = tele_y
					state = 0
					alarm[0] = 60
					break
				}
			}
		}
	}
	else if (state == 2){ //attack
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
						//shoot only if you can see
						var bullet_1 = instance_create_depth(x,y,depth,obj_bullet)
						bullet_1.dir = dir
						var bullet_2 = instance_create_depth(x,y,depth,obj_bullet)
						bullet_2.dir = dir-10
						var bullet_3 = instance_create_depth(x,y,depth,obj_bullet)
						bullet_3.dir = dir+10
						//stop the loop
						lines = line_length+1
						rays = ray_count+1
						break
					}
				}
			}
			dir+= (add_angle * rays) * angle_dir
			angle_dir*=-1
		}
		state = 0
		if (distance_to_object(obj_skeleton) < 128){
			alarm[0] = 30
		}
		else{
			alarm[0] = 60
		}
	}
}
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