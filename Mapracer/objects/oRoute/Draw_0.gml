
/// Draw Event for Route Visualization
// Draw the route as a polyline and waypoints

draw_set_color(c_red);
var pts = ds_list_size(screen_points);
for (var i = 0; i < pts - 1; i++) {
    var p1 = screen_points[| i];
    var p2 = screen_points[| i + 1];
    draw_line(p1[0], p1[1], p2[0], p2[1]);
}

// Draw waypoints
for (var i = 0; i < pts; i++) {
    var p = screen_points[| i];
    draw_circle(p[0], p[1], 4, false);
}

draw_set_color(c_white);
