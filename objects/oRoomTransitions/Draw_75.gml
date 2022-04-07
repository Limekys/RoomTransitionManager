///@desc Draw transition
if top_offset <= 0 exit;
draw_set_color(c_black);
draw_rectangle(-1, -1, __GUI_WIDTH + 1, top_offset, 0);
draw_rectangle(-1, __GUI_HEIGHT + 1, __GUI_WIDTH + 1, bottom_offset, 0);

//Debug
if !draw_debug exit;
draw_set_color(c_white);
draw_text(128, 128, "Current room: " + string(room));
draw_text(128, 128 + 16, "Target room: " + string(target_room));
