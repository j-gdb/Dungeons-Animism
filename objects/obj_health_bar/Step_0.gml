pause_key = keyboard_check_pressed(ord("P"));
if global.current_hp <= 0
{
	global.current_hp = 0;
	time_source_stop(hp_timer);
} else {
	if global.paused == false && global.current_hp > 0 {
		time_source_start(hp_timer)
	}
}
if !(global.current_hp <= 30) {
	if effect_active == true {
		layer_enable_fx("Effect_1", false);
		effect_active = false;
	} 
} else {
	if effect_active == false {
		layer_enable_fx("Effect_1", true);
		effect_active = true;
	}
}
//iframes
if (global.can_hit == false){
	if (alarm[0] <= 0){
		alarm[0] = iframes
	}
}

if  pause_key && global.paused == true && delay <= 0  {
	time_source_resume(hp_timer);
	delay = delay_timer;
} else if pause_key && global.paused == false && delay <= 0  {
	time_source_stop(hp_timer);
	delay = delay_timer;
}
if global.paused == true && instance_exists(obj_text_box) {
	time_source_stop(hp_timer);
}
if delay > 0 {
	delay--;
}
if (global.current_hp <= 0 and global.paused == false){
	global.paused = true
	if (instance_exists(obj_sword)){
		with (obj_sword){
			instance_destroy(obj_sword)
			var particle_death = part_type_create()
			part_type_sprite(particle_death, spr_effect,0,0,0)
			part_type_life(particle_death, 30,45)
			part_type_alpha3(particle_death, 1,0.7,0.1)
			part_type_size(particle_death, 1,3,0,0.1)
			var range = irandom_range(45,60) //number of particles
			for (var i = 0; i < range; i++){
				var off_x = random_range(-15,15) //random offset
				var off_y = random_range(-15,15)
				part_particles_create(global.particle_system, x+off_x,y+off_y, particle_death, 1)
				var d = random_range(0,360)
				part_type_direction(particle_death, d, d, 0, 5)
				part_type_speed(particle_death, 1, 5, 0.1, 0.1)
			}
		}
		with(obj_skeleton){
			visible=false //turn invisible
		}
	}
	else{
		with(obj_skeleton){
			visible=false //turn invisible
			var particle_death = part_type_create()
			part_type_sprite(particle_death, spr_effect,0,0,0)
			part_type_life(particle_death, 30,45)
			part_type_alpha3(particle_death, 1,0.7,0.1)
			part_type_size(particle_death, 1,3,0,0.1)
			var range = irandom_range(45,60) //number of particles
			for (var i = 0; i < range; i++){
				var off_x = random_range(-15,15) //random offset
				var off_y = random_range(-15,15)
				part_particles_create(global.particle_system, x+off_x,y+off_y, particle_death, 1)
				var d = random_range(0,360)
				part_type_direction(particle_death, d, d, 0, 5)
				part_type_speed(particle_death, 1, 5, 0.1, 0.1)
			}
		}
	}
	instance_create_depth(x,y,-1,obj_transition)
	global.current_hp = 100
}