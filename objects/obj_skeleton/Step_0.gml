if global.paused == false {
	//movement
	if (move == true){
		var hor = (-keyboard_check(ord("A")) + keyboard_check(ord("D"))) * speed_normal;
		var ver = (-keyboard_check(ord("W")) + keyboard_check(ord("S"))) * speed_normal;
		if (hor !=0 and ver != 0){
		    hor*=diag_mod
			ver*=diag_mod
		}
		if (place_meeting(x+hor, y, obj_wall_parent)){
			hor = 0
		}
		if (place_meeting(x,y+ver, obj_wall_parent)){
			ver = 0
		}
		x += hor;
		y += ver;
	}
	//shooting the sword
	if (mouse_check_button_pressed(mb_left) and move == true and thro == true){
		if (mouse_x >= 0 and mouse_x <= room_width and mouse_y >= 0 and mouse_y <= room_height){ //want them to click within the room
			click_x = mouse_x //mouse points to pass to sword
			click_y = mouse_y
			var sword = instance_create_depth(x,y,-1,obj_sword)
			sword.click_x = self.click_x
			sword.click_y = self.click_y
			sword.dir = point_direction(x,y,click_x, click_y)
			sword.owner_id = id //allows the sword returning to reactivate the skeleton
			move = false
		}
	}
}
	