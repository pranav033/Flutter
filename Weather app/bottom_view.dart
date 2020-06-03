import 'package:flutter/material.dart';
import 'forecast_card.dart';
import 'model.dart';


Widget bottomview(AsyncSnapshot<WeatherForecastModel> snapshot,BuildContext context)
{
    var forecastlist = snapshot.data.list;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text("7-Day Forecast".toUpperCase(),
        style: TextStyle(color: Colors.black54),),
        Container(
          height: 170,
            padding: EdgeInsets.all(8),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context,index)=> SizedBox(width: 8,),
              itemCount: forecastlist.length,
            itemBuilder: (context,index)=>ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                width: MediaQuery.of(context).size.width / 2.5,
                height: 160,
                child: forecastcard(snapshot,index),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Color(0xff9661c3),Colors.white],
                    begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
                ),
              ),
            ),
          ),
        )
      ],
    );

}