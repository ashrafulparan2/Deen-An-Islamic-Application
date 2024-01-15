import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as GoogleMaps;
import 'package:lottie/lottie.dart' as Lottie;
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../global/global.dart';

class MosqueScreen extends StatelessWidget {
  MosqueScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getCurrentLiveLocationOfUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return FutureBuilder(
              future: getNearbyMosques(),
              builder: (context, placesSnapshot) {
                if (placesSnapshot.connectionState == ConnectionState.done) {
                  return GoogleMaps.GoogleMap(
                    initialCameraPosition: GoogleMaps.CameraPosition(
                      target: GoogleMaps.LatLng(
                        currentPositionOfUser!.latitude,
                        currentPositionOfUser!.longitude,
                      ),
                      zoom: 15,
                    ),
                    zoomControlsEnabled: true,
                    zoomGesturesEnabled: true,
                    mapType: GoogleMaps.MapType.normal,
                    myLocationEnabled: true,
                    onMapCreated: (GoogleMaps.GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                    markers: Set.from(placesSnapshot.data!.map(
                      (place) => GoogleMaps.Marker(
                        markerId: GoogleMaps.MarkerId(place['place_id']),
                        position: GoogleMaps.LatLng(
                          place['geometry']['location']['lat'],
                          place['geometry']['location']['lng'],
                        ),
                        infoWindow: GoogleMaps.InfoWindow(
                          title: place['name'],
                          snippet: place['vicinity'],
                        ),
                      ),
                    )),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<void> getCurrentLiveLocationOfUser() async {
    Position positionOfUser = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.bestForNavigation,
    );
    currentPositionOfUser = positionOfUser;
  }

  Future<List<Map<String, dynamic>>> getNearbyMosques() async {
    final apiKey =
        'AIzaSyAz53HJ9y8znPBGmXlHvb3ic7uIJmr2Mdg'; // Replace with your API key
    final radius = 5000; // Adjust the radius as needed
    final url = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?'
        'location=${currentPositionOfUser!.latitude},${currentPositionOfUser!.longitude}'
        '&radius=$radius&type=mosque&key=$apiKey';

    final response = await http.get(Uri.parse(url));
    final Map<String, dynamic> data = json.decode(response.body);

    return List<Map<String, dynamic>>.from(data['results']);
  }

  final Completer<GoogleMaps.GoogleMapController> _controller =
      Completer<GoogleMaps.GoogleMapController>();

  static const GoogleMaps.CameraPosition _kLake = GoogleMaps.CameraPosition(
    bearing: 192.8334901395799,
    target: GoogleMaps.LatLng(37.43296265331129, -122.08832357078792),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );
}
