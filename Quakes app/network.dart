import 'model.dart';
import 'package:http/http.dart';
import 'dart:convert';
class Network
{
  Future<quake_model> getquakes() async
  {
    var url = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_day.geojson";
    var response = await get(Uri.encodeFull(url));
    if(response.statusCode == 200)
      {
        print(response.body);
        return quake_model.fromJson(jsonDecode(response.body));
      }
    else
      {
        throw Exception("Error");
      }
  }
}