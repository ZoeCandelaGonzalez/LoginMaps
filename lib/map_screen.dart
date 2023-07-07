
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loginmapa/controller.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final controller = Controller();

  

final _controller = Controller();
@override
  void initState() {
 
    super.initState();
    _controller.addListener(() {
      setState(() {
        
      });
    });
  }
  late LatLng posicion;


  @override
  Widget build(BuildContext context) {
  
    return Scaffold( 
      appBar: AppBar(
        
        title: Text('Sucursal', style: TextStyle( fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),),

        leading: Icon(Icons.arrow_back_ios, color: Colors.white,),
        backgroundColor: Color(0xff906EF5),
      ),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
          child:
          GoogleMap(
            markers: _controller.marker,
            initialCameraPosition: _controller.initialCameraPosition,
            zoomControlsEnabled: false,
            mapType: MapType.hybrid,
            compassEnabled: false,
            onCameraMove: (position) {
              posicion = position.target;
            },
          
          ),
          ),
          
          Center(child: Icon(Icons.location_on,color: Colors.red,size: 50,),),
           TextButton(onPressed: (){
            _controller.onTap(posicion);
           }, 
           child: Text('Seleccionar Ubicación'))
        ],
      ),
    );

  }

 
}