//SETTINGS
#macro _ROOM_MANAGER_TEXT_FONT fArial
#macro _ROOM_MANAGER_SMOOTHNESS 8
#macro _ROOM_MANAGER_SHOW_DEBUG false

#macro ROOM_MANAGER GetRoomManager()

function GetRoomManager() {
	if !instance_exists(oRoomTransitions) {
		return instance_create_depth(0, 0, -1000, oRoomTransitions);
	}
	return instance_find(oRoomTransitions, 0);
}
