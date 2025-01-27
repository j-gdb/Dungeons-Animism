// Inherit the parent event
event_inherited();
tele_x = 0
tele_y = 0
state = 0
line_length = 300
range_teleport = 224

//particles
dir = 0
particle_teleport = part_type_create()
part_type_sprite(particle_teleport, spr_teleport_effect,0,0,0)
part_type_life(particle_teleport, 15,30)
part_type_alpha3(particle_teleport, 1,0.8,0.5)
part_type_size(particle_teleport, 0.5,1,-0.01,0)