//movement
speed_normal = 3
diag_mod = 0.707
depth = 1
move = true

//sword
dir = 0 //direction sword moves
click_x = 0 // mouse.x when click
click_y = 0 // mouse.y when click
thro = false //can't throw for first second
alarm[0] = 30

//draw
x_offset = 0
y_offset = 0
sword_dist = 12

if (room == room_tutorial_3 and global.tb_2 == false){
	global.tb_2 = true
	global.paused = true
	create_textbox("Shards")
}

if (room == room_tutorial_4 and global.tb_3 == false){
	global.tb_3 = true
	global.paused = true
	create_textbox("Shields")
}
