if (async_load[? "id"] == global.last_request_id) {
    var status = async_load[? "status"];
    var result = async_load[? "result"];

    if (status == 0) {
        show_debug_message("Request successful");
        show_debug_message(result);
        
        // Optionally parse JSON:
        var parsed = json_parse(result);
		show_debug_message(parsed);
        // Access route data: e.g., parsed["features"][0]["geometry"]["coordinates"];
        
    } else {
        var http_status = async_load[? "http_status"];
        show_debug_message("HTTP Error: " + string(http_status));
    }
}
