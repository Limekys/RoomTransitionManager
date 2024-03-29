///@desc Logic
switch (state)
{
	case TRANSITION.nothing: 
		top_offset = -1;
		bottom_offset = __GUI_HEIGHT;
	break;
	
	case TRANSITION.appear: 
		//Top
		top_offset = SmoothApproachDelta(top_offset, __GUI_HEIGHT / 2, smoothness);
		if top_offset >= __GUI_HEIGHT / 2 && !wait_to_change
		{
			before_change_function();
			before_change_function = function() { };
			state = TRANSITION.disappear;
			room_goto(target_room);
		}
		//Bottom
		bottom_offset = SmoothApproachDelta(bottom_offset, __GUI_HEIGHT / 2, smoothness);
	break;
	
	case TRANSITION.disappear: 
	
		if wait_to_end break;
		
		//Top
		top_offset = SmoothApproachDelta(top_offset, 0, smoothness);
		if top_offset <= 0
		{
			state = TRANSITION.nothing;
		}
		
		//Bottom
		bottom_offset = SmoothApproachDelta(bottom_offset, __GUI_HEIGHT, smoothness);
		
	break;
}
