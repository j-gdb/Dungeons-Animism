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
/*if (place_meeting(x,y,obj_wall_parent)){
	for (var i = 0; i < 1000; i++){
		if (!place_meeting(x+i, y, obj_wall_parent)){
			x+=i
			break
		}
		if (!place_meeting(x-i, y, obj_wall_parent)){
			x-=i
			break
		}
		if (!place_meeting(x, y+i, obj_wall_parent)){
			y+=i
			break
		}
		if (!place_meeting(x, y-i, obj_wall_parent)){
			y-=i
			break
		}
		if (!place_meeting(x+i, y+i, obj_wall_parent)){
			x+=i
			y+=i
			break
		}
		if (!place_meeting(x-i, y+i, obj_wall_parent)){
			x-=i
			y+=i
			break
		}
		if (!place_meeting(x-i, y+i, obj_wall_parent)){
			y+=i
			x-=i
			break
		}
		if (!place_meeting(x+i, y-i, obj_wall_parent)){
			y-=i
			x+=i
			break
		}
	}
}