draw_self()
if (!instance_exists(obj_sword)){
	dir = point_direction(x,y,mouse_x,mouse_y)
	//Make the skeleton rotate with the sword
	image_angle = dir;
	//Flip the Y scale depending on the dir 
		if (dir > 90) && (dir < 270) {
			draw_sprite_ext(spr_sword_display,-1,x,y,1,-1,dir,c_white,1)
			image_yscale = -1
		} else {
		draw_sprite_ext(spr_sword_display,-1,x,y,1,1,dir,c_white,1)
		image_yscale = 1
		}
}