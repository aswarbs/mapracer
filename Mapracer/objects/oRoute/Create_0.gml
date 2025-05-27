/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
/// Create Event for Route Visualization
// Assumes `route` is a ds_list of ds_lists: each inner list [lon, lat]
// Maps geographic coords to room coordinates based on bounding box

/// Example Test Route: Assign in Create Event before using the visualization code
route = ds_list_create();

var coords = [
    [-0.15, 51.5],
    [-0.14, 51.51],
    [-0.13, 51.49],
    [-0.12, 51.52],
    [-0.11, 51.5]
];

for (var i = 0; i < array_length(coords); i++) {
    var pair = ds_list_create();
    ds_list_add(pair, coords[i][0]); // longitude
    ds_list_add(pair, coords[i][1]); // latitude
    ds_list_add(route, pair);
}

// Compute bounding box
min_lon = -1;
max_lon = 1;
min_lat = 50;
max_lat = 52;
var count = ds_list_size(route);
for (var i = 0; i < count; i++) {
    var coord = route[| i];
    var lon = coord[| 0];
    var lat = coord[| 1];
    if (lon < min_lon) min_lon = lon;
    if (lon > max_lon) max_lon = lon;
    if (lat < min_lat) min_lat = lat;
    if (lat > max_lat) max_lat = lat;
}

// Precompute screen points
screen_points = ds_list_create();
for (var i = 0; i < count; i++) {
    var coord = route[| i];
    var lon = coord[| 0];
    var lat = coord[| 1];
    // Normalize [0..1]
    var nx = (lon - min_lon) / (max_lon - min_lon);
    var ny = (lat - min_lat) / (max_lat - min_lat);
    // Map to room coordinates (invert Y if needed)
    var x1 = lerp(0, room_width, nx);
    var y1 = lerp(room_height, 0, ny);
    ds_list_add(screen_points, [x, y]);
}
