

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Controller extends ChangeNotifier{

final Map <MarkerId, Marker> _marker = {};


  Set<Marker>  get marker => _marker.values.toSet();


final initialCameraPosition = CameraPosition(
  target: LatLng(-27.375388, -55.889209),
  zoom: 18
  );



 

  void onTap (LatLng position) {
    final id = _marker.length.toString();
    final markerId = MarkerId(id);
    final marker = Marker(markerId: markerId,
    position: position,
    onTap: () {
     
    }
    );
    _marker[markerId] = marker;
    notifyListeners();


  }

  

}