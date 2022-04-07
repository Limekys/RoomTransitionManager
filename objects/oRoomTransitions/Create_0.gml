//SETTINGS
//#macro _TRANSITION_TEXT_FONT fArial
#macro _TRANSITION_SMOOTHNESS 8

//INITIALIZATION
enum TRANSITION {
	nothing,
	appear,
	disappear
}

depth = -1000;

__GUI_WIDTH = display_get_gui_width();
__GUI_HEIGHT = display_get_gui_height();

state = TRANSITION.nothing;
top_offset = -1;
bottom_offset = __GUI_HEIGHT;
target_room = noone;
wait_to_end = false;	//Can be used if you want to temporarily stop the transition after changing rooms
wait_to_change = false;	//Can be used if you want to temporarily stop the transition to the room
smoothness = _TRANSITION_SMOOTHNESS;
draw_debug = true;

_smooth_approach = function(value, destination, smoothness, threshold = 0.01) {
	var difference = destination - value;
    if (abs(difference) < threshold) return destination;
	return(lerp(value, destination, 1/smoothness));
}

_before_change_function = function() {
	
}
