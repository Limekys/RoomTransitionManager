/// @desc  Manage Delta Timing Update
dtPrevious = dt;
dt = delta_time/1000000;
global.dt_unsteady = dt*dt_scale;

if (dt > 1/dt_fps_min) {
	if (dtRestored) { 
		dt = 1/dt_fps_min; 
	} else { 
		dt = dtPrevious;
		dtRestored = true;
	}
} else {
	dtRestored = false;
}

global.dt_steady = dt*dt_scale;