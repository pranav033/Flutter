import 'package:flutter/material.dart';
import 'model.dart';
import 'util.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_converter.dart';

Widget midview(AsyncSnapshot<WeatherForecastModel> snapshot)
{
  var forecastlist = snapshot.data.list;
  var city_name = snapshot.data.city.name;
  var city_country = snapshot.data.city.country;
  var forecast = forecastlist[0];
  var formatteddate = new DateTime.fromMillisecondsSinceEpoch(forecast.dt * 1000);
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("${city_name}, ${city_country}",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
         //   fontStyle: FontStyle.italic,
            color: Colors.black87,
          ),),
          Text("${utils.getformatteddate(formatteddate)}",style: TextStyle(fontSize: 15),),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: getConvertedIcon(weather_description: forecastlist[0].weather[0].main,color: Colors.pinkAccent,size: 190),
          ),
          //Icon(FontAwesomeIcons.cloud,size: 190,color: Colors.pinkAccent,),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("${forecast.temp.day.toStringAsFixed(0)}"+"C  ",style: TextStyle(fontSize: 28),),
                Text("${forecast.weather[0].description.toUpperCase()}")
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: <Widget>[
                      Text("${forecast.speed.toStringAsFixed(1)}"+" mi/h"),
                      Icon(FontAwesomeIcons.wind,size: 20,color: Colors.brown,)
                      //Icon(Icons.arrow_forward,size: 20,color: Colors.brown,),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: <Widget>[
                      Text("${forecast.humidity}"+" %"),
                      Icon(FontAwesomeIcons.solidGrinBeamSweat,size: 20,color: Colors.brown,),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: <Widget>[
                      Text("${forecast.temp.max.toStringAsFixed(0)}"+"C"),
                      Icon(FontAwesomeIcons.temperatureHigh,size: 20,color: Colors.brown,),
                    ],
                  ),
                )
              ],
            ),
          )


        ],
      ),
    ),
  );
}