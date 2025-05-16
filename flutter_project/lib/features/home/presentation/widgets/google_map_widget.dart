// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

import 'package:mobile_final_project/features/home/data/models/restaurant.dart';

class GoogleMapWidget extends StatefulWidget {
  const GoogleMapWidget({super.key, required this.restaurant});

  final Restaurant restaurant;

  @override
  State<GoogleMapWidget> createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  LatLng? userLatLng;
  late LatLng restaurantLatLng;
  Set<Marker> markers = {};
  Set<Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    restaurantLatLng = LatLng(
      widget.restaurant.latitude ?? 0.0,
      widget.restaurant.longitude ?? 0.0,
    );
    _getUserLocation();
  }

  Future<void> _getUserLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }
    if (permission == LocationPermission.deniedForever) return;

    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      userLatLng = LatLng(position.latitude, position.longitude);
      markers = {
        Marker(
          markerId: const MarkerId('user'),
          position: userLatLng!,
          infoWindow: const InfoWindow(title: 'You'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
        Marker(
          markerId: const MarkerId('restaurant'),
          position: restaurantLatLng,
          infoWindow: InfoWindow(title: widget.restaurant.name ?? 'Restaurant'),
        ),
      };
      polylines = {
        Polyline(
          polylineId: const PolylineId('route'),
          points: [userLatLng!, restaurantLatLng],
          color: Colors.blue,
          width: 4,
        ),
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return userLatLng == null
        ? const Center(child: CircularProgressIndicator())
        : GoogleMap(
          initialCameraPosition: CameraPosition(
            target: restaurantLatLng,
            zoom: 17,
          ),
          markers: markers,
          polylines: polylines,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
        );
  }
}
