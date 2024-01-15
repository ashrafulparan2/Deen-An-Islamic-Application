import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deen/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart' as GoogleMaps;
import 'package:geolocator/geolocator.dart';
import '../../../../global/global.dart';

import 'dart:async';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const IconData arrow_back_ios_outlined =
      IconData(0xee84, fontFamily: 'MaterialIcons', matchTextDirection: true);
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // FirebaseFirestore firestore=FirebaseFirestore.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  // final databaseReference = FirebaseDatabase.instance.reference();
  FirebaseAuth auth = FirebaseAuth.instance;
  // User? user = FirebaseAuth.instance.currentUser;

  // Widget listItem({required double latitude, required double longitude}) {
  //   return Container(
  //     margin: const EdgeInsets.all(10),
  //     padding: const EdgeInsets.all(10),
  //     height: 110,
  //     color: Colors.amberAccent,
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           'Latitude: $latitude',
  //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
  //         ),
  //         const SizedBox(
  //           height: 5,
  //         ),
  //         Text(
  //           'Longitude: $longitude',
  //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Tracker'),
        // leading: TextButton(
        //   onPressed: () {
        //     setState(() {
        //       auth.signOut();
        //       Navigator.pushNamed(context, RouteGenerator.tabScreen);
        //     });
        //   },
        //   child: Text(
        //     "Log Out",
        //     style: TextStyle(
        //       color: Colors.cyan,
        //     ),
        //   ),
        // ),
        actions: [
          // Add the logout icon button
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              setState(() {
                auth.signOut();
                Navigator.pushNamed(context, RouteGenerator.tabScreen);
              });
            },
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        child: StreamBuilder(
          stream: firestore.collection('users').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data!.docs;
              var x = data.map((e) {
                // print(e['latitude']);
                return e['latitude'];
              }).toList();
              var y = data.map((e) {
                // print(e['latitude']);
                return e['longitude'];
              }).toList();

              print(x);
              print(y);
              // List locations = data.map((e){})
              print(data);
              return Container(
                child: FutureBuilder(
                  future: getCurrentLiveLocationOfUser(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
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
                        onMapCreated:
                            (GoogleMaps.GoogleMapController controller) {
                          _controller.complete(controller);
                        },
                        markers: Set.from(
                          List.generate(x.length, (index) {
                            return GoogleMaps.Marker(
                              markerId: GoogleMaps.MarkerId(index.toString()),
                              position: GoogleMaps.LatLng(
                                x[index],
                                y[index],
                              ),
                              infoWindow: GoogleMaps.InfoWindow(
                                title: 'Custom Place $index',
                                snippet: 'Custom Snippet $index',
                              ),
                            );
                          }),
                        ),
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              );
            } else
              return Container();
          },
        ),
      ),
    );
  }

  Future<void> getCurrentLiveLocationOfUser() async {
    Position positionOfUser = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.bestForNavigation,
    );
    currentPositionOfUser = positionOfUser;
  }

  final Completer<GoogleMaps.GoogleMapController> _controller =
      Completer<GoogleMaps.GoogleMapController>();
}
