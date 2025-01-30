draw_set_font(fnt_text)
//Border between the options and the edge of the text box
op_border = 16;
//Space between the options
op_space = 48;
//Current position selected in the menu
pos = 0;
h_pos = 0;
//Length of the options in the current menu
op_length = 0;
//Current menu
menu_level = 0;
//Variables for mouse control
menu_x_pos = camera_get_view_width(view_camera[0]) * .5;       //X position for the menu
menu_y_pos = camera_get_view_height(view_camera[0]) * .6;     //Y position for the menu
click_area_w = 20;								 //width of the area we can click to change values

global.dsm_settings = ds_map_create();

ds_map_add(SET, "sfx", [global.sound, [0, 10]]);
ds_map_add(SET, "music", [global.music, [0, 10]]);
ds_map_add(SET, "screen", [global.full_screen, ["Off", "On"]]);

//Starting menu
option[MAIN, 0] = "Play";
option[MAIN, 1] = "Settings";
option[MAIN, 2] = "Exit";

//Settings menu
option[SETTINGS, 0] = "Back"
option[SETTINGS, 1] = "Sound"
option[SETTINGS, 2] = "Video"

//Sound menu
option[SOUND, 0] = "Back";
option[SOUND, 1] = ["< SFX >" , "sfx"];
option[SOUND, 2] = ["< Music >" , "music"];

//Video menu
option[VIDEO, 0] = "Back";
option[VIDEO, 1] = ["< Full Screen >" , "screen"];


function button(_y, _wl, _wr, _h) constructor {
	y = _y;					//selection position y
	wl = _wl;			    //click area width left
	wr = _wr;		    //click area width right
	h = _h;				//click area height
}

//initialize a menu for each button entry
var _h = 40;
for (var a = 0; a < TOTAL; ++a) {
    for (var b = 0; b < array_length(option[a]); ++b) {
	    button_arr[a][b] = new button(0, room_width/2, room_width/2, _h);
	}
}
