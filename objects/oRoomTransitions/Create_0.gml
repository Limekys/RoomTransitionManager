enum TRANSITION {
	nothing,
	appear,
	disappear
}

__GUI_WIDTH = display_get_gui_width();
__GUI_HEIGHT = display_get_gui_height();

state = TRANSITION.nothing;
top_offset = -1;
bottom_offset = __GUI_HEIGHT;
target_room = room_first;
wait_to_end = false;	//Can be used if you want to temporarily stop the transition after changing rooms
wait_to_change = false;	//Can be used if you want to temporarily stop the transition to the room
smoothness = _ROOM_MANAGER_SMOOTHNESS;
draw_debug = _ROOM_MANAGER_SHOW_DEBUG;
transition_text = "";

before_change_function = function() {
	
}

goto = function(room, wait_to_end = false, wait_to_change = false, transition_text = "") {
	self.state = TRANSITION.appear;
	self.target_room = room;
	self.wait_to_end = wait_to_end;
	self.wait_to_change = wait_to_change;
	self.transition_text = transition_text;
}

goto_next = function(wait_to_end = false, wait_to_change = false, transition_text = "") {
	var _target_room = room_next(room);
	if !room_exists(_target_room) _target_room = room_first;
	
	goto(_target_room, wait_to_end, wait_to_change);
}

goto_previous = function(wait_to_end = false, wait_to_change = false, transition_text = "") {
	var _target_room = room_previous(room);
	if !room_exists(_target_room) _target_room = room_last;
	
	goto(_target_room, wait_to_end, wait_to_change);
}

continue_transition = function() {
	self.wait_to_end = false;
}

continue_to_change = function() {
	self.wait_to_change = false;
}

set_before_change_function = function(_function) {
	self.before_change_function = _function;
}
