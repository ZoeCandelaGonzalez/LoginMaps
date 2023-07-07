
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
 
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
 
class _HomeScreenState extends State<HomeScreen> {

  Completer<GoogleMapController> _controller = Completer();
 final CameraPosition _sucursales = const CameraPosition(
      target: LatLng(37.42796133580664, -122.885749655962),
    zoom: 14.4746,
  );
   
   List<Marker> _marker = [];
  final List<Marker> _list = const [

    Marker(
        markerId: MarkerId('1'),
      position: LatLng(-27.394840, -55.962392),
      infoWindow: InfoWindow(
        title: 'Sucursal 1',
      )
  ),
  
    
  ];
 
  @override
  void initState() {
  
    super.initState();
    _marker.addAll(_list);
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff906EF5),
        title: Text("Encontranos"),
      ),
      body: Container(
        child: SafeArea(
         child: GoogleMap(
        initialCameraPosition: _sucursales,
         
          markers: Set<Marker>.of(_marker),
          mapType: MapType.normal,
          myLocationEnabled: true,
          zoomControlsEnabled: true,
     
          compassEnabled: true,
         
            onMapCreated: (GoogleMapController controller){
                _controller.complete(controller);
            },
          ),
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          GoogleMapController controller = await _controller.future;
          controller.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(
          target: LatLng(-27.375330, -55.916473
),
              zoom: 14,
            )
          ));
          setState(() {
          });
        },
     
        child: Icon(Icons.home),
      ),
    );
  }
}