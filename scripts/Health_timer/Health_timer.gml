global.max_hp = 100;
global.current_hp = 100;
	global.current_hp = clamp(global.current_hp, 0, global.max_hp);

function draw_hp() {
	if global.current_hp > 97 {
		return 0
	} else if global.current_hp > 95 && global.current_hp <= 97 {
		return 1;
	} else if global.current_hp > 90 && global.current_hp <= 95 {
		return 2
	} else if global.current_hp > 85 && global.current_hp <= 90 {
		return 3
	} else if global.current_hp > 80 && global.current_hp <= 85 {
		return 4
	} else if global.current_hp > 75 && global.current_hp <= 80 {
		return 5
	} else if global.current_hp > 70 && global.current_hp <= 75 {
		return 6
	} else if global.current_hp > 65 && global.current_hp <= 70 {
		return 7
	} else if global.current_hp > 60 && global.current_hp <= 65 {
		return 8
	} else if global.current_hp > 55 && global.current_hp <= 60 {
		return 9
	} else if global.current_hp > 50 && global.current_hp <= 55 {
		return 10
	} else if global.current_hp > 45 && global.current_hp <= 50  {
		return 11
	} else if global.current_hp > 40 && global.current_hp <= 45  {
		return 12
	} else if global.current_hp > 35 && global.current_hp <= 40  {
		return 13
	} else if global.current_hp > 30 && global.current_hp <= 35  {
		return 14
	} else if global.current_hp > 25 && global.current_hp <= 30  {
		return 15
	} else if global.current_hp > 20 && global.current_hp <= 25  {
		return 16
	} else if global.current_hp > 15 && global.current_hp <= 20  {
		return 17
	} else if global.current_hp > 10 && global.current_hp <= 15  {
		return 18
	} else if global.current_hp > 5 && global.current_hp <= 10  {
		return 19
	} else if global.current_hp > 0 && global.current_hp <= 5  {
		return 20
	} else if global.current_hp == 0 && global.current_hp <= 50  {
		return 21
	}
}