if (global.can_hit == true){
	if (!audio_is_playing(snd_player_hit)){
		audio_sound_gain(snd_player_hit, 20, 0)
		audio_play_sound(snd_player_hit, 20, false)
	}
	global.can_hit = false
	global.current_hp-=25
}