//movement
click_x = 0
click_y = 0
spd = 15
//move = false

//passed in from parent
move = true //can the sword move (not returning)
ret = false //is the sword returning
dir = 0 //direction to move
owner_id = 0 //id of parent
counter = 0 //extra pixels (very negligable but it does look nice

/*if (place_meeting(x,y,obj_wall_parent)){ //just in case, don't think this can happen
	alarm[0] = 30
}*/
alarm[1] = 15

//particles
particle_death = part_type_create()
part_type_sprite(particle_death, spr_effect,0,0,0)
part_type_life(particle_death, 30,45)
part_type_alpha3(particle_death, 1,0.7,0.1)
part_type_size(particle_death, 1,3,0,0.1)