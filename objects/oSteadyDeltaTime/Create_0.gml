global.dt_steady = 0;
global.dt_unsteady = 0;
dt_fps_min = 30; // Default: 10 -- Not too hot, not too cold, but just right
dt_scale = 1.0; // Default: 1.0 -- Set higher to increase speed and lower to decrease speed

//***************
// DON'T TOUCH //
//***************
dt = delta_time/1000000;
dtPrevious = dt;
dtRestored = false;