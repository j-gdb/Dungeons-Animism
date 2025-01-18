if (follow != noone){
	xTo = follow.x
	yTo = follow.y
}

x+= (xTo-x)/3
y+=(yTo-y)/3

camera_set_view_pos(view_camera[0], x-(view_width/2), y-(view_height/2))