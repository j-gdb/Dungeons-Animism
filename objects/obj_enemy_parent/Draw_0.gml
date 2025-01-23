if (distance_to_object(obj_skeleton) < 250){// and seen == false){
	dir = point_direction(x,y,obj_skeleton.x, obj_skeleton.y)
	for (var rays = 0; rays < ray_count; rays++){
		for (var lines = 0; lines < line_length; lines+=8){
			var xx = x+lengthdir_x(lines, dir)
			var yy = y+lengthdir_y(lines, dir)
			if (position_empty(xx,yy) == false){
				if (instance_place(xx,yy,obj_wall_parent) != noone){
					draw_set_color(c_red)
					draw_circle(xx,yy,5,false)
					break
				}
				if (instance_place(xx,yy,obj_skeleton) != noone){
					draw_set_color(c_red)
					draw_circle(xx,yy,5,false)
					break
				}
			}
			draw_set_color(c_lime)
			draw_point(xx,yy)
		}
		dir+= (add_angle * rays) * angle_dir
		angle_dir*=-1
	}
}
draw_self()