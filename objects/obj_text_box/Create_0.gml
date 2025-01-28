depth = -9999
//Text box parameters
	text_box_width = 620;
	text_box_height = 120;
	border = 12;
	line_sep = 48;
	txtb_img = 0;
	txtb_img_spd = 1;
	//How long a line is before a new one is created
	line_width = text_box_width - (border*2);
	
//Text
page = 0;
page_number = 0;
text[0] = "";
text_lenght[0] = string_length(text[0]);

//Left 0 in the array is character and right 0 is page
char[ 0, 0 ] = " ";
char_x[ 0, 0 ] = 0;
char_y[ 0, 0 ] = 0;

draw_char = 0;
text_spd = .6;

setup = false;

//Effects
scr_set_defaults_for_text();
last_free_space = 0;
