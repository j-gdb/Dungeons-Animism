#macro SET global.dsm_settings
#macro MAIN				0
#macro SETTINGS		1
#macro SOUND			2
#macro VIDEO			3
#macro TOTAL			4

global.mp_grid = 0;
global.paused = false;
global.full_screen = 0;

global.dsm_settings = ds_map_create();
global.sound = 7;
global.music = 7;
ds_map_add(SET, "sfx", [global.sound, [0, 10]]);
ds_map_add(SET, "music", [global.music, [0, 10]]);

audio_group_set_gain(ag_sound, SET[? "sfx"][0]/10, 0);
audio_group_load(ag_sound);
audio_group_set_gain(audiogroup_default, SET[? "music"][0]/10, 0);