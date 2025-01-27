if (instance_exists(parent) and parent.seen == true){
	dir = point_direction(parent.x, parent.y, obj_skeleton.x, obj_skeleton.y)
	image_angle = dir
	x = parent.x + lengthdir_x(20, dir)
	y = parent.y + lengthdir_y(20, dir)
}
else if(instance_exists(parent) and parent.seen == false){
	x = parent.x+20
	y = parent.y
}
else if (!instance_exists(parent)){
	instance_destroy()
}
if (distance_to_object(obj_sword) < 2){
	with(parent){
		path_end()
	}
	parent.calc_path_timer = 0
	parent.stop = true
	if (obj_sword.ret == true){
		instance_destroy()
		with(parent){
			alarm[0] = 0
			calc_path_timer = irandom_range(15,30)
			var node_id = nth_nearest(x,y,obj_node, 2) //where they move towards
			if (node_id != noone){
				var _chase = mp_grid_path(global.mp_grid, path, x, y, node_id.x, node_id.y, true);
				if _chase {
					path_start(path, move_spd+2, path_action_stop, true);
				}
			}
		}
	}
}