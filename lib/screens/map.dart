import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demeassist/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ignore: must_be_immutable
class Map extends StatefulWidget {
  String email;
  Map({this.email});
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('LocationDetails')
            .where('email', isEqualTo: widget.email)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: SpinKitCubeGrid(
                color: primaryViolet,
              ),
            );
          return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(snapshot.data.docs[0]['latitude'],
                  snapshot.data.docs[0]['longitude']),
              zoom: 18.0,
            ),
            mapType: MapType.normal,
            myLocationEnabled: true,
            compassEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            myLocationButtonEnabled: true,
            markers: _createMarker(snapshot.data.docs[0]['latitude'],
                snapshot.data.docs[0]['longitude']),
          );
        },
      ),
    );
  }

  Set<Marker> _createMarker(double lat, double lng) {
    return <Marker>[
      Marker(
        markerId: MarkerId('patient'),
        position: LatLng(lat, lng),
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(title: "Patient"),
      ),
    ].toSet();
  }

  // _handleMarker(LatLng points) {
  //   setState(() {
  //     tracker = [];
  //     tracker.add(
  //       Marker(
  //           markerId: MarkerId(
  //             points.toString(),
  //           ),
  //           position: points),
  //     );
  //   });
  // }
}
