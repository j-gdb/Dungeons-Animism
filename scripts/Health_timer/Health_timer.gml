global.max_hp = 100;
global.current_hp = 100;
	global.current_hp = clamp(global.current_hp, 0, global.max_hp);

function draw_hp() {
	if global.current_hp > 90 {
		return 0;
	} else if global.current_hp > 80 && global.current_hp <= 90 {
		return 1
	} else if global.current_hp > 70 && global.current_hp <= 80 {
		return 2
	} else if global.current_hp > 60 && global.current_hp <= 70 {
		return 3
	} else if global.current_hp > 50 && global.current_hp <= 60 {
		return 4
	} else if global.current_hp > 40 && global.current_hp <= 50 {
		return 5
	} else if global.current_hp > 30 && global.current_hp <= 40 {
		return 6
	} else if global.current_hp > 20 && global.current_hp <= 30 {
		return 7
	} else if global.current_hp > 10 && global.current_hp <= 20 {
		return 8
	} else if global.current_hp > 0 && global.current_hp <= 10 {
		return 9
	} else if global.current_hp == 0  {
		return 10
	}
}