import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'model.dart';
import 'network.dart';
import 'package:async/async.dart';

class quake extends StatefulWidget {
  @override
  _quakeState createState() => _quakeState();
}

class _quakeState extends State<quake> {
//  GoogleMapController mapController;
//  static final LatLng _center = const LatLng(23.3528945,85.3119077);
//
//  void onMapcreated(GoogleMapController controller)
//  {
//    mapController = controller;
//  }
List<Marker> markerlist = <Marker>[];

double zoomval = 5.0;

Future<quake_model> _quakesdata;

Completer<GoogleMapController> _controller = Completer();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _quakesdata = Network().getquakes();
    _quakesdata.then((value) => {
      debugPrint("place: ${value.features[0].properties.place}")
    });
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildgooglemap(context),
          zoomMinus(),
          zoomPlus(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: (){findquakes();},
          label: Text("Find Quakes"),),
    );
}

Widget zoomPlus(){
  return Padding(
    padding: const EdgeInsets.only(top:38.0),
    child: Align(
      alignment: Alignment.topRight,
      child: IconButton(icon: Icon(FontAwesomeIcons.searchPlus),
          onPressed: (){
        zoomval++;
        _plus(zoomval);
          }),
    ),
  );
}

Widget zoomMinus(){
  return Padding(
    padding: const EdgeInsets.only(top:38.0),
    child: Align(
      alignment: Alignment.topLeft,
      child: IconButton(icon: Icon(FontAwesomeIcons.searchMinus),
          onPressed: (){
        zoomval--;
        _minus(zoomval);
          }),
    ),
  );
}

  Widget _buildgooglemap(BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GoogleMap(
          onMapCreated: (GoogleMapController controller){
            _controller.complete(controller);
            
          },
          initialCameraPosition: CameraPosition(target: LatLng(16.3221059,79.9250133),zoom: 5),
          markers: Set<Marker>.of(markerlist),
        ),

      );
  }

  void findquakes() {

      setState(() {
        markerlist.clear();
        _handleresponse();
      });

  }

  void _handleresponse() {

  setState(() {
    _quakesdata.then((quake_model) =>
    {
      quake_model.features.forEach((quake)=>{
        markerlist.add(Marker(markerId: MarkerId(quake.id),
        infoWindow: InfoWindow(title: quake.properties.mag.toString(),snippet: quake.properties.title),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
          position: LatLng(quake.geometry.coordinates[1], quake.geometry.coordinates[0]),
        ))
      })
    });
  });
  }

  Future<void> _minus(double zoomval) async {
  final GoogleMapController controller = await _controller.future;
  controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(40.712776,-74.005974),zoom: zoomval))
  );
  }

  Future<void> _plus(double zoomval) async{
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(40.712776,-74.005974),zoom: zoomval)));
  }
//      appBar: AppBar(
//        title: Text("Maps"),
//
//      ),
//      body: GoogleMap(initialCameraPosition: CameraPosition(target: _center,zoom: 11.0),
//      onMapCreated: onMapcreated,
//      mapType: MapType.satellite,
//      markers: {portlandMarker},),
//      floatingActionButton: FloatingActionButton.extended(onPressed: _goToIntel, label: Text("Intel Co-orp!"),
//      icon: Icon(Icons.place),),
//    );
//  }
//
//  static final CameraPosition intelPosition = CameraPosition(target: LatLng(16.3221059,79.9250133),zoom: 13.0,tilt: 34,
//      bearing: 190);
//
//  Future<void> _goToIntel() async {
//    GoogleMapController controller = await mapController;
//    controller.animateCamera(CameraUpdate.newCameraPosition(intelPosition));
//  }
//
//  Marker portlandMarker = Marker(markerId: MarkerId("Portlend"),
//  position: _center,
//  infoWindow: InfoWindow(title: "Home",snippet: "Hello Home"),
//  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),

}
