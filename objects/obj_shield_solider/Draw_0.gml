// Inherit the parent event
event_inherited();
if (attack == false){
	if (seen == true){
		var spr_dir = point_direction(x,y,obj_skeleton.x, obj_skeleton.y)
		draw_sprite_ext(spr_spear, 0,x,y,1,1,spr_dir, c_white, 1)
	}
	else{
		draw_sprite_ext(spr_spear, 0,x+10,y,1,1,90, c_white, 1)
	}
}
if (has_shard == true){
	sprite_index = spr_test_enemy_rare
}
//draw_path(path,x,y,true)