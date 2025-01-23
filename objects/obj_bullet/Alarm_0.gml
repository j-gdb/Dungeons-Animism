var range = irandom_range(1,2)
for (var i = 0; i < range; i++){
	part_particles_create(global.particle_system, x,y, particle_trail, 1)
	var d = random_range(dir-20,dir+20)
	part_type_direction(particle_trail,d, d, 0, 25)
	part_type_speed(particle_trail, 0.1, 0.5, -0.01, 0.1)
}
alarm[0] = irandom_range(1, 3)