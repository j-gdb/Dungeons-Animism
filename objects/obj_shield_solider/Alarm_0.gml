var spear = instance_create_depth(x,y,depth-1,obj_spear)
spear.angle = point_direction(x,y,obj_skeleton.x, obj_skeleton.y)
attack = true
alarm[1] = 10