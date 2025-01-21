if (distance_to_object(obj_skeleton) < 320 and seen == false){
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
					break
				}
			}
		}
		dir+= (add_angle * rays) * angle_dir
		angle_dir*=-1
	}
}
if (seen == true){
	if (state == 1){ //teleport
		tele_x = random_range(obj_skeleton.x-300, obj_skeleton.x+300)
		tele_y = random_range(obj_skeleton.y-170, obj_skeleton.y+170)
		if (0 < tele_x and tele_x < room_width and  0 < tele_y and tele_y < room_height){
			if (place_empty(tele_x, tele_y, [obj_skeleton, obj_wall_parent])){
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