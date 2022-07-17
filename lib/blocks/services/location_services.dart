import 'dart:async';

import 'package:location/location.dart';
import 'package:yalla/blocks/model/User_location.dart';

class LocationService {
   UserLocation _currentLocation = UserLocation();

  Location location = Location();

  StreamController<UserLocation> _locationController =
      StreamController<UserLocation>.broadcast();

  LocationService(){
    location.requestPermission().then((granted)   {
     if(granted == PermissionStatus.granted){
       location.onLocationChanged.listen((locationData)
       {
         if(locationData != null){
           _locationController.add(UserLocation(latitude: locationData.latitude, longtude: locationData.longitude));
         }
       }
       );
     }
    }
    );
  }

  Stream<UserLocation> get locationStream => _locationController.stream;
  Future<UserLocation> getLocation() async {
    try {
      var userLocation = await location.getLocation();
      _currentLocation = UserLocation(
          latitude: userLocation.latitude, longtude: userLocation.longitude);
    } catch (e) {
      print('Couldnt get the location $e');
    }
    return _currentLocation;
  }
}
