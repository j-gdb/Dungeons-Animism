dir = 0
particle_trail = part_type_create()
part_type_sprite(particle_trail, spr_bullet_trail,0,0,0)
part_type_life(particle_trail, 20,20)
part_type_alpha3(particle_trail, 1,0.5,0.01)
part_type_size(particle_trail, 0.1,1,0,0)

alarm[0] = 2