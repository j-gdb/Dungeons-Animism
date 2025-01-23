if (seen == true){
	calc_path_timer = 30
	for (var i = 1; i < 1000; i+=1){
		if (place_meeting(x, y+i, obj_wall_parent)){
			y-=i
			break
		}
		if (place_meeting(x-i, y, obj_wall_parent)){
			x+=i
			break
		}
		if (place_meeting(x+i, y, obj_wall_parent)){
			x-=i
			break
		}
		if (place_meeting(x, y-i, obj_wall_parent)){
			y+=i
			break
		}
		if (place_meeting(x-i, y-i, obj_wall_parent)){
			x+=i
			y+=i
			break
		}
		if (place_meeting(x+i, y-i, obj_wall_parent)){
			x-=i
			y+=i
			break
		}
		if (place_meeting(x-i, y+i, obj_wall_parent)){
			y-=i
			x+=i
			break
		}
		if (place_meeting(x-i, y-i, obj_wall_parent)){
			y+=i
			x+=i
			break
		}
	}
	mp_grid_path(global.mp_grid, path, x, y, obj_skeleton.x, obj_skeleton.y, false);
	path_start(path, move_spd, path_action_stop, false);
}
else{
	for (var i = 1; i < 1000; i+=1){
		if (place_meeting(x, y+i, obj_wall_parent)){
			y-=i
			break
		}
		if (place_meeting(x-i, y, obj_wall_parent)){
			x+=i
			break
		}
		if (place_meeting(x+i, y, obj_wall_parent)){
			x-=i
			break
		}
		if (place_meeting(x, y-i, obj_wall_parent)){
			y+=i
			break
		}
		if (place_meeting(x-i, y-i, obj_wall_parent)){
			x+=i
			y+=i
			break
		}
		if (place_meeting(x+i, y-i, obj_wall_parent)){
			x-=i
			y+=i
			break
		}
		if (place_meeting(x-i, y+i, obj_wall_parent)){
			y-=i
			x+=i
			break
		}
		if (place_meeting(x-i, y-i, obj_wall_parent)){
			y+=i
			x+=i
			break
		}
	}
	mp_grid_path(global.mp_grid, path, x, y, new_x, new_y, false);
	path_start(path, 1, path_action_stop, false)
}