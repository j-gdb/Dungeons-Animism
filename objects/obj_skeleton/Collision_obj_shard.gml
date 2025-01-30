if (other.can_pickup == true){
	global.shard_count-=1
	audio_play_sound(snd_shard_collect, 1, false)
	with(other){
		instance_destroy()
	}
}