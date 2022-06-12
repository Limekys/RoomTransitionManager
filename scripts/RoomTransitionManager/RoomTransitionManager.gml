///@desc RoomManager by Limekys
#macro _ROOM_MANAGER_VERSION "2022.06.12"

//SETTINGS
#macro _ROOM_MANAGER_TEXT_FONT fArial
#macro _ROOM_MANAGER_SMOOTHNESS 8
#macro _ROOM_MANAGER_SHOW_DEBUG false

#macro ROOM_MANAGER _GetRoomManager()

function _GetRoomManager() {
	if !instance_exists(oRoomTransitions) {
		return instance_create_depth(0, 0, -1000, oRoomTransitions);
	}
	return instance_find(oRoomTransitions, 0);
}
