if (other.can_pickup == true){
	global.shard_count-=1
	with(other){
		instance_destroy()
	}
}