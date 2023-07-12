
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapaScreen extends StatefulWidget {
  const MapaScreen({Key? key}) : super(key: key);
 
  @override
  _MapaScreenState createState() => _MapaScreenState();
}
 
class _MapaScreenState extends State<MapaScreen> {

  final Completer<GoogleMapController> _controller = Completer();
 final CameraPosition _sucursales = const CameraPosition(
      target: LatLng(-27.394840, -55.962392),
    zoom: 14.4746,
  );
   
   final List<Marker> _marker = [];
  final List<Marker> _list = const [

    Marker(
        markerId: MarkerId('1'),
      position: LatLng(-27.394840, -55.962392),
      infoWindow: InfoWindow(
        title: 'Sucursal 1',
      )
  ),
    Marker(
        markerId: MarkerId('2'),
      position: LatLng(-27.415240, -55.972185),
      infoWindow: InfoWindow(
        title: 'Sucursal 2',
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
    return GestureDetector(
       onTap: () {
           
            context.go('/home');
          },
      child: Scaffold(
        
        appBar: AppBar(
        
          backgroundColor: const Color(0xff906EF5),
          title: Text('Nuestras sucursales', style: TextStyle(fontSize: 30, color: Colors.white.withOpacity(0.7), fontWeight: FontWeight.bold),), 
          leading: Icon( Icons.arrow_back_ios_new_outlined , color: Colors.white.withOpacity(0.5),),
        ),
        body: SafeArea(
         child: GoogleMap(
        initialCameraPosition: _sucursales,
         
          markers: Set<Marker>.of(_marker),
          mapType: MapType.hybrid,
          myLocationEnabled: true,
          zoomControlsEnabled: true,
       
          compassEnabled: true,
         
            onMapCreated: (GoogleMapController controller){
                _controller.complete(controller);
            },
          ),
        ),
        
     floatingActionButton: Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
      padding: const EdgeInsets.only(left: 20), 
      child: FloatingActionButton(
        onPressed: () async {
          GoogleMapController controller = await _controller.future;
          controller.animateCamera(
            CameraUpdate.newCameraPosition(
              const CameraPosition(
                target: LatLng(-27.394840, -55.962392),
                zoom: 14,
              ),
            ),
          );
          setState(() {});
        },
        child: const Icon(Icons.home),
      ),
      ),
    ),
      ),
    ); }
}
