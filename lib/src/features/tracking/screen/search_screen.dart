import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart';

import '../../../../global/global.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen();

   getCurrentLiveLocationOfUser() async
   {
     Position positionOfUser = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
     currentPositionOfUser = positionOfUser;
     GoogleMapController? controllerGoogleMap;


     LatLng positionOfUserInLatLng = LatLng(currentPositionOfUser!.latitude, currentPositionOfUser!.longitude);

     CameraPosition cameraPosition = CameraPosition(target: positionOfUserInLatLng, zoom: 15);
     controllerGoogleMap!.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

     // await CommonMethods.convertGeoGraphicCoOrdinatesIntoHumanReadableAddress(currentPositionOfUser!, context);

     // await getUserInfoAndCheckBlockStatus();

     // await initializeGeoFireListener();
   }

   final Completer<GoogleMapController> _controller =
   Completer<GoogleMapController>();

   static const CameraPosition _kGooglePlex = CameraPosition(
     target: LatLng(37.42796133580664, -122.085749655962),
     zoom: 14.4746,
   );

   static const CameraPosition _kLake = CameraPosition(
       bearing: 192.8334901395799,
       target: LatLng(37.43296265331129, -122.08832357078792),
       tilt: 59.440717697143555,
       zoom: 19.151926040649414);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        // mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
        mapType: MapType.normal,
        myLocationEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

   Future<void> _goToTheLake() async {
     final GoogleMapController controller = await _controller.future;
     await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
   }
}