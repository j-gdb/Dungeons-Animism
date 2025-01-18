//movement
if (mouse_check_button_pressed(mb_left) and move = false){
	if (mouse_x >= 0 and mouse_x <= room_width and mouse_y >= 0 and mouse_y <= room_height){ //want them to click within the room
		click_x = mouse_x //still use click_x and click_y to check distance
		click_y = mouse_y
		dir = point_direction(x,y,click_x, click_y)
		move = true
		alarm[0] = 60//set a limit on how long the sword can move 
	}
}
if ( sqrt(power((x-click_x),2) + power((y-click_y),2)) < 5){//sqrt is slow, but we can ignore it
	move = false
	alarm[0] = 0
}

//bug occurs somewhere here
if (move == true){//move the sword. 
	if(!place_meeting(x+lengthdir_x(10, dir), y+lengthdir_y(10, dir), obj_wall_parent)){
		x+=lengthdir_x(10,dir)
		y+=lengthdir_y(10,dir)
	}
	else{//if too close to a wall, move up until the point you hit the wall. Maximum of 10 iterations run
		while(!place_meeting(x+lengthdir_x(1, dir), y+lengthdir_y(1, dir), obj_wall_parent)){
			x+=lengthdir_x(1,dir)
			y+=lengthdir_y(1,dir)
		}
		move = false
	}
}
////


if (move == false){
	alarm[0] = 0 //this might be uncessessary
}