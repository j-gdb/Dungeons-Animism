if (mouse_check_button_pressed(mb_left) and move == true){
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
global.current_hp = 100