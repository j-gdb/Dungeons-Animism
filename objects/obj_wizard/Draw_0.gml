// Inherit the parent event
event_inherited();
if (has_shard == true){
	sprite_index = spr_wizard_rare
}

var wizard_dir = point_direction(x,y,obj_skeleton.x, obj_skeleton.y)

if wizard_dir > 90 && wizard_dir < 270 {
	image_xscale = -1;
} else {
	image_xscale = 1;
}