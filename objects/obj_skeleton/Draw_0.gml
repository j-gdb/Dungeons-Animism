draw_self()
sprite_index = global.prev_player
if (!instance_exists(obj_sword)){
	if global.paused == false {
		dir = point_direction(x,y,mouse_x,mouse_y)
	}
	//Make the skeleton rotate with the sword
	//image_angle = dir;
	if global.paused == false {
		x_offset = lengthdir_x(sword_dist, dir)
		y_offset = lengthdir_y(sword_dist, dir)
	}
	//Flip the Y scale depending on the dir 
		if (dir > 90) && (dir < 270) {
			draw_sprite_ext(spr_sword_display,-1,x + x_offset,y + y_offset,-1,-1,dir,c_white,1)
			image_xscale = -1
		} else {
		draw_sprite_ext(spr_sword_display,-1,x + x_offset,y + y_offset,-1,1,dir,c_white,1)
		image_xscale = 1
		}
}

//draw_text(x, y -32, global.current_hp)