function ors_get_coordinates(location_string)
{
    var api_key = ORS_API_KEY;
    var base_url = "https://api.openrouteservice.org/geocode/search";
    var query = "?api_key=" + api_key + "&text=" + url_encode(location_string) + "&size=1";
    var full_url = base_url + query;

    // Send HTTP GET request
    var request_id = http_get(full_url);

    // Store the request ID if you want to track the response
    global.last_request_id = request_id;
}
