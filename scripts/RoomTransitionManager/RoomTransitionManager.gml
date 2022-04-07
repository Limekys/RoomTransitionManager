function RoomManagerCheckExist() {
	if !instance_exists(oRoomTransitions) {
		return instance_create_depth(0, 0, -1000, oRoomTransitions);
	}
	return false;
}

function RoomManagerGotoExt(room, wait_to_end = false, wait_to_change = false) {
	RoomManagerCheckExist();
	
	oRoomTransitions.state = TRANSITION.appear;
	oRoomTransitions.target_room = room;
	oRoomTransitions.wait_to_end = wait_to_end;
	oRoomTransitions.wait_to_change = wait_to_change;
}

function RoomManagerGotoNext(wait_to_end = false, wait_to_change = false) {
	RoomManagerCheckExist();
	
	var _target_room = room_next(room);
	if !room_exists(_target_room) _target_room = room_first;
	
	oRoomTransitions.state = TRANSITION.appear;
	oRoomTransitions.target_room = _target_room;
	oRoomTransitions.wait_to_end = wait_to_end;
	oRoomTransitions.wait_to_change = wait_to_change;
}

function RoomManagerGotoPrevious(wait_to_end = false, wait_to_change = false) {
	RoomManagerCheckExist();
	
	var _target_room = room_previous(room);
	if !room_exists(_target_room) _target_room = room_last;
	
	oRoomTransitions.state = TRANSITION.appear;
	oRoomTransitions.target_room = _target_room;
	oRoomTransitions.wait_to_end = wait_to_end;
	oRoomTransitions.wait_to_change = wait_to_change;
}

function RoomManagerTransitionEnd() {
	oRoomTransitions.wait_to_end = false;
}

function RoomManagerChangeRoom() {
	oRoomTransitions.wait_to_change = false;
}

function RoomManagerSetBeforeChangeFunction(_function) {
	oRoomTransitions._before_change_function = _function;
}
