import 'package:flutter/material.dart';
import 'model.dart';
import 'util.dart';
import 'icon_converter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget forecastcard(AsyncSnapshot<WeatherForecastModel> snapshot,int index)
{
  var forecastlist = snapshot.data.list;
  var day = "";
  var formatteddate = new DateTime.fromMillisecondsSinceEpoch(forecastlist[index].dt * 1000);
  var fulldate = utils.getformatteddate(formatteddate);
  day = fulldate.split(",")[0];
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Center(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(day),

      )),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 34,
            backgroundColor: Colors.white,
            child: getConvertedIcon(weather_description: forecastlist[index].weather[0].main,color: Colors.pinkAccent,size: 40),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Row(
                      children: <Widget>[
                        Text("${forecastlist[index].temp.min.toStringAsFixed(0)} C  "),
                        Icon(FontAwesomeIcons.solidArrowAltCircleDown,color: Colors.white,size: 17,)
                      ],
                ),
                Row(
                  children: <Widget>[
                    Text("${forecastlist[index].temp.max.toStringAsFixed(0)} C  "),
                    Icon(FontAwesomeIcons.solidArrowAltCircleUp,color: Colors.white,size: 17,)
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("${forecastlist[index].humidity.toStringAsFixed(0)} %  "),
                    Icon(FontAwesomeIcons.solidGrinBeamSweat,color: Colors.white,size: 17,)
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("${forecastlist[index].speed.toStringAsFixed(0)} mi/hr  "),
                    Icon(FontAwesomeIcons.wind,color: Colors.white,size: 17,)
                  ],
                ),

              ],
            ),
          )
        ],
      )
    ],
  );
}