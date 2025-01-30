//move the sword towards target
if (move == true){ 
	if(!place_meeting(x+lengthdir_x(spd, dir), y+lengthdir_y(spd, dir), obj_wall_parent) and !place_meeting(x+lengthdir_x(spd, dir), y+lengthdir_y(spd, dir), obj_shield)){
		x+=lengthdir_x(spd,dir)
		y+=lengthdir_y(spd,dir)
	}
	//if too close to a wall, move up until the point you hit the wall. Maximum of 10 iterations run
	else{
		while(!place_meeting(x+lengthdir_x(1, dir), y+lengthdir_y(1, dir), obj_wall_parent) and !place_meeting(x+lengthdir_x(1, dir), y+lengthdir_y(1, dir), obj_shield)){
			counter++
			x+=lengthdir_x(1,dir)
			y+=lengthdir_y(1,dir)
		}
		alarm[1] = 0
		alarm[0] = 5 //adds a little pause at the end of moving
		move = false
	}
}

//checks within a ball of radius 5 pixels if the sword has reached where you clicked
if (sqrt(power((x-click_x),2) + power((y-click_y),2)) < 5 and move = true){//sqrt is slow, but we can ignore it
	alarm[1] = 0
	alarm[0] = 15
	move = false
}

//returns the sword to the skeletin
if (ret == true){
	if(!place_meeting(x+lengthdir_x(spd, dir), y+lengthdir_y(spd, dir), obj_skeleton) && !place_meeting(x+lengthdir_x(spd, dir), y+lengthdir_y(spd, dir), obj_shrine)){
		x-=lengthdir_x(spd,dir)
		y-=lengthdir_y(spd,dir)
	}
	//counter is the number of extra pixel steps we needed to draw
	else{
		x-=lengthdir_x(counter, dir)
		y-=lengthdir_y(counter, dir)
		owner_id.move = true //lets skull move again
		instance_destroy()
	}
}

var enemy = instance_place(x,y,obj_enemy_parent)
if (enemy != noone){// and (move==true or ret == true)){
	alarm[1] = 0
	move = false
	global.prev_player = enemy.sprite_index //store enemy sprite
	
	obj_camera.shake_value = 1 //screen shake
	
	//create death particles
	var range = irandom_range(30,45) //number of particles
	for (var i = 0; i < range; i++){
		var off_x = random_range(-15,15) //random offset
		var off_y = random_range(-15,15)
		part_particles_create(global.particle_system, enemy.x+off_x,enemy.y+off_y, particle_death, 1)
		var d = random_range(0,360)
		part_type_direction(particle_death, d, d, 0, 5)
		part_type_speed(particle_death, 1, 5, 0.1, 0.1)
	}
	
	//create new player and clean up
	var new_player = instance_create_depth(enemy.x, enemy.y, 0, obj_skeleton)
	if (global.prev_player == spr_test_enemy or global.prev_player == spr_test_enemy_rare){
		global.prev_player = spr_test_enemy_player
	}
	else if (global.prev_player == spr_wizard or global.prev_player == spr_wizard_rare){
		global.prev_player = spr_wizard_player
	}
	new_player.sprite_index = global.prev_player
	instance_destroy(enemy)
	instance_destroy(owner_id)
	if (global.current_hp < 60){
		global.current_hp+=40
	}
	else{
		global.current_hp = 100
	}
	audio_play_sound(snd_enemy_die, 10, false)
	instance_destroy()
}