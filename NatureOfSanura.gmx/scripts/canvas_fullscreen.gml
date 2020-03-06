/// @function               canvas_fullscreen(base)
/// @param {int}    base    The base value for scaling on both axis

var _base = argument0;
var _bw = browser_width;
var _bh = browser_height;

var minLength = min(_bw, _bh);
view_wport[0] = minLength;
view_hport[0] = minLength;
window_set_size(minLength, minLength);
window_center();

view_wview[0] = room_width;
view_hview[0] = room_height;
view_wport[0] = minLength;
view_hport[0] = minLength;
surface_resize(application_surface, view_wport[0], view_hport[0]);
