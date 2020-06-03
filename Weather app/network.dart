import 'model.dart';
import 'util.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Network{

  Future<WeatherForecastModel> getweatherforecast({String cityName})
  async {
    var finalurl = "https://api.openweathermap.org/data/2.5/forecast/daily?q=${cityName}&units=metric&appid=${utils.appid}";

    final response = await get(Uri.encodeFull(finalurl));
    print("URL : ${Uri.encodeFull(finalurl)}");

    if(response.statusCode == 200)
      {
        print("Data : ${response.body}");
        return WeatherForecastModel.fromJson(jsonDecode(response.body));
      }
    else{
      throw Exception("Error");
    }
  }
}