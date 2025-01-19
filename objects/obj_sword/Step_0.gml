//movement
/*if (mouse_check_button_pressed(mb_left) and move == false){
	if (mouse_x >= 0 and mouse_x <= room_width and mouse_y >= 0 and mouse_y <= room_height){ //want them to click within the room
		click_x = mouse_x //still use click_x and click_y to check distance
		click_y = mouse_y
		dir = point_direction(x,y,click_x, click_y)
		move = true
		alarm[0] = 30//set a limit on how long the sword can move 
	}
}*/


//move the sword towards target
if (move == true){ 
	if(!place_meeting(x+lengthdir_x(10, dir), y+lengthdir_y(10, dir), obj_wall_parent)){
		x+=lengthdir_x(10,dir)
		y+=lengthdir_y(10,dir)
	}
	//if too close to a wall, move up until the point you hit the wall. Maximum of 10 iterations run
	else{
		while(!place_meeting(x+lengthdir_x(1, dir), y+lengthdir_y(1, dir), obj_wall_parent)){
			counter++
			x+=lengthdir_x(1,dir)
			y+=lengthdir_y(1,dir)
		}
		alarm[0] = 30 //adds a little pause at the end of moving
		move = false
	}
}

//checks within a ball of radius 5 pixels if the sword has reached where you clicked
if (sqrt(power((x-click_x),2) + power((y-click_y),2)) < 5 and move = true){//sqrt is slow, but we can ignore it
	alarm[0] = 30
	move = false
}

//returns the sword to the skeletin
if (ret == true){
	if(!place_meeting(x+lengthdir_x(10, dir), y+lengthdir_y(10, dir), obj_skeleton)){
		x-=lengthdir_x(10,dir)
		y-=lengthdir_y(10,dir)
	}
	//counter is the number of extra pixel steps we needed to draw
	else{
		x-=lengthdir_x(counter, dir)
		y-=lengthdir_y(counter, dir)
		owner_id.move = true //lets skull move again
		instance_destroy()
	}
}

//todo: when you hit and kill and enemy, they turn into a skeleton. Original skeleton destroyed.