if global.current_hp <= 0
{
	global.current_hp = 0;
	time_source_stop(hp_timer);
} else {
	time_source_start(hp_timer)
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