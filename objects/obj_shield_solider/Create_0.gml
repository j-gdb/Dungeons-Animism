// Inherit the parent event
event_inherited();
state = 0
attack = false //have you attacked
shield_id = instance_create_depth(x+20, y, depth-1, obj_shield)
shield_id.parent = id
stop = false