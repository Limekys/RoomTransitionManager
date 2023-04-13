///@desc Draw transition

if top_offset <= 0 exit;

//Rectangles
draw_set_color(c_black);
draw_rectangle(-1, -1, __GUI_WIDTH + 1, top_offset, 0);
draw_rectangle(-1, __GUI_HEIGHT + 1, __GUI_WIDTH + 1, bottom_offset, 0);

//Text
if transition_text != "" && top_offset >= __GUI_HEIGHT / 2 {
	draw_set_font(_ROOM_MANAGER_TEXT_FONT);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(__GUI_WIDTH div 2, __GUI_HEIGHT / 2, transition_text);
}


//Debug
if !draw_debug exit;
draw_set_color(c_black);
DrawSetText(c_white, , fa_center, fa_middle, 1);
draw_text(display_get_gui_width() div 2, display_get_gui_height() div 2 - 16, "Current room: " + string(room));
draw_text(display_get_gui_width() div 2, display_get_gui_height() div 2 + 16, "Target room: " + string(target_room));
