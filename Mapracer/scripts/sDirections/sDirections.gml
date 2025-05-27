function ors_get_directions(start_lat, start_long, end_lat, end_long)
{
	var pos_start = string(start_long) + "," + string(start_lat);
	var pos_end = string(end_long) + "," + string(end_lat);
	
    var api_key = ORS_API_KEY;
    var url = "https://api.openrouteservice.org/v2/directions/driving-car";
    var full_url = url + "?api_key=" + api_key + "&start=" + pos_start + "&end=" + pos_end;

    // Send HTTP GET request
    var request_id = http_get(full_url);
    
    // Store request_id if needed to track multiple requests
    global.last_request_id = request_id
}