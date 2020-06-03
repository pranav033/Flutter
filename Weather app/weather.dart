import 'package:flutter/material.dart';
import 'model.dart';
import 'network.dart';
import 'midview.dart';
import 'bottom_view.dart';

class weather extends StatefulWidget {
  @override
  _weatherState createState() => _weatherState();
}

class _weatherState extends State<weather> {

  Future<WeatherForecastModel> forecastobject;

  String _cityname = "Ranchi";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forecastobject  = getweather(cityName: _cityname);
    //print(forecastobject);
//    forecastobject.then((weather)
//    {
//
//      print(weather.list[0].weather[0].main);
//    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text("Forecast"),
//        backgroundColor: Colors.blue,
//        centerTitle: true,
//      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CityTextField(),
          ),
          Container(
            child:
            FutureBuilder(
                future: forecastobject,
                builder: (BuildContext context,AsyncSnapshot snapshot){
                  if(snapshot.hasData)
                    {
                      return Column(
                        children: <Widget>[
                          midview(snapshot),
                         bottomview(snapshot,context),
                        ],
                      );                    }
                  else
                  {
                    return Container(
                    alignment : Alignment.center,
                    child: CircularProgressIndicator(),
                    );
                  }
                }),
          )
        ],
      )
    );
  }

  Widget CityTextField() {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          hintText: "Enter City Name",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),

          ),
          contentPadding: EdgeInsets.all(8),
        ),
        onSubmitted: (value){
            setState(() {
              _cityname = value;
              forecastobject = getweather(cityName: _cityname);
            });
        },
      ),
    );
  }

  Future<WeatherForecastModel> getweather( {String cityName}) => new Network().getweatherforecast(cityName: _cityname);


}
