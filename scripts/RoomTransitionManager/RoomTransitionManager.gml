///@desc RoomManager by Limekys
#macro _ROOM_MANAGER_VERSION "2022.06.12"

//SETTINGS
#macro _ROOM_MANAGER_TEXT_FONT fArial
#macro _ROOM_MANAGER_SMOOTHNESS 4
#macro _ROOM_MANAGER_SHOW_DEBUG true

#macro ROOM_MANAGER _GetRoomManager()

function _GetRoomManager() {
	//try to activate
	instance_activate_object(oRoomTransitions);
	//check for exists
	if !instance_exists(oRoomTransitions) {
		//create
		return instance_create_depth(0, 0, -1000, oRoomTransitions);
	}
	//find
	return instance_find(oRoomTransitions, 0);
}