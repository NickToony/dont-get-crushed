// Create blank camera
camera = camera_create();
view_visible[0] = true;

// Matrixes
var vm = matrix_build_lookat(global.CENTER_X, global.CENTER_X, -10, global.CENTER_X, global.CENTER_X, 0, 0, 1, 0);
var pm = matrix_build_projection_ortho(view_wport[0], view_hport[0], 1, 1000);
// Apply
camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);
// give camera to view
view_camera[0] = camera;

// Settings
zoom = 1;
zoomTo = 2;
zoomSpeed = 0.05;
minZoom = 0.5;
maxZoom = 7;