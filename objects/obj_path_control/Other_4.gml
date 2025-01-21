//set grid size
#macro TILESIZE 32
randomize()

//get tiles in room
var _w = ceil(room_width/TILESIZE);
var _h = ceil(room_height/TILESIZE);

//create motion planning grid
global.mp_grid = mp_grid_create(0, 0, _w, _h, TILESIZE, TILESIZE);

//add solid instances to grid
mp_grid_add_instances(global.mp_grid, obj_wall_parent, false);