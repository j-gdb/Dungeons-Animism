//ray casting stuff
add_angle = 3
dir = 0
ray_count = 3
line_length = 224 //distance they can "see"
active_distance = 300
angle_dir = 1

seen = false

//set a delay for calculating path
//calc_path_delay = 10;
//set a timer for when we calc a path
calc_path_timer = 0;
move_spd = 2;
path = path_add();

//wandering
can_wander = 0
new_x = 1
new_y = 1