Simple room transition manager. Just import to project and use.

ROOM_MANAGER.goto(asset:room, bool:wait_to_end_transition, bool:wait_to_change_room, string:transition_text);

ROOM_MANAGER.goto_next(bool:wait_to_end_transition, bool:wait_to_change_room, string:transition_text);

ROOM_MANAGER.goto_previous(bool:wait_to_end_transition, bool:wait_to_change_room, string:transition_text);

ROOM_MANAGER.continue_transition();

ROOM_MANAGER.continue_to_change();

ROOM_MANAGER.set_before_change_function(function);
