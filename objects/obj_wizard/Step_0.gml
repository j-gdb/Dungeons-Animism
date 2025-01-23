if (distance_to_object(obj_skeleton) < 250 and seen == false){
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
					alarm[1] = 30
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
		tele_x = random_range(obj_skeleton.x-160, obj_skeleton.x+160)
		tele_y = random_range(obj_skeleton.y-160, obj_skeleton.y+160)
		if (0 < tele_x and tele_x < room_width and  0 < tele_y and tele_y < room_height){
			if (place_empty(tele_x, tele_y, [obj_skeleton, obj_wall_parent, obj_enemy_parent])){
				x = tele_x
				y = tele_y
				state = 0
				alarm[0] = 60
			}
		}
	}
	else if (state == 2){ //attack
		dir = point_direction(x,y,obj_skeleton.x, obj_skeleton.y)
		for (var rays = 0; rays < 3; rays++){
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
		alarm[0] = 40
	}
}
else if (seen == false){
	if (can_wander < 90){
		if (alarm[10] <= 0){
			alarm[10] = irandom_range(60, 300)
		} 
	}
	else{
		if (can_wander <= 100){
			new_x = x+irandom_range(-room_width/4, room_width/4)
			new_y = y+irandom_range(-room_height/4, room_height/4)
			while (!place_empty(new_x, new_y, [obj_wall_parent, obj_skeleton, obj_enemy_parent])){
				new_x = x+irandom_range(-room_width/4, room_width/4)
				new_y = y+irandom_range(-room_height/4, room_height/4)
			}
			can_wander = 101 //let us move to wandering
		}
		if (can_wander == 101){
			mp_grid_path(global.mp_grid, path, x, y, new_x, new_y, true);
			path_start(path, 1, path_action_stop, false)
			alarm[11] = 60 //should have made it
			can_wander = 102 //lets not do this again
		}
	}
}