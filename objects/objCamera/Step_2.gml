zoom = zoom + (zoomTo - zoom) / 100;
if (instance_exists(objPlayer)) {
	zoomTo = (max(objPlayer.dist*1.3, 100) / START_DISTANCE) * maxZoom;
} else {
	zoomTo = 0;
}
zoomTo = min(max(zoomTo, minZoom), maxZoom);
var vm = matrix_build_lookat(global.CENTER_X, global.CENTER_Y, -10, global.CENTER_X, global.CENTER_Y, 0, 0, 1, 0);
var pm = matrix_build_projection_ortho(view_wport[0] * zoom, view_hport[0] * zoom, 1, 1000);
camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);