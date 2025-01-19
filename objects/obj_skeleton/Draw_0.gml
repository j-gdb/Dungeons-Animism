draw_self()
if (!instance_exists(obj_sword)){
	dir = point_direction(x,y,mouse_x,mouse_y)
	draw_sprite_ext(spr_sword_display,-1,x,y,1,1,dir,c_white,1)
}