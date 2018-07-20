/// canvas_fullscreen(base, browser_width, browser_height)
// argument0 = base value for scaling
// argument1 = the current browser width
// argument2 = the current browser height

view_wport[0] = argument1;
view_hport[0] = argument2;

window_set_size(argument1, argument2);
window_center();

var aspect = (argument1 / argument2);
if (aspect < 1)
    {
    view_hview[0] = argument0;
    view_wview[0] = (argument0 * aspect);
    }
else
    {
    view_hview[0] = (argument0 / aspect);
    view_wview[0] = argument0;
    }

surface_resize(application_surface, view_wview[0], view_hview[0]);
//display_set_gui_size(room_width, room_height);
