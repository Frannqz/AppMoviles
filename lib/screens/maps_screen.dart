import 'dart:async';
import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
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

  static const LatLng sourceLocation = LatLng(20.536051, -100.809000);
  static const LatLng destination = LatLng(20.540439, -100.813106);

  List<LatLng> polylineCoordinates = [];
  LocationData? currentLocation;

  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;

  void getCurrentLocation() async {
    Location location = Location();

    location.getLocation().then((location) {
      currentLocation = location;
    });

    GoogleMapController googleMapController = await _controller.future;

    location.onLocationChanged.listen((newLoc) {
      currentLocation = newLoc;

      googleMapController
          .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
              zoom: 19.151926040649414,
              target: LatLng(
                newLoc.latitude!,
                newLoc.longitude!,
              ))));
      setState(() {});
    });
  }

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyBjdj5kr4z0vqy6Oe2yb4ehvbui3K_rR_0",
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );

    if (result.points.isNotEmpty) {
      result.points.forEach(
        (PointLatLng point) =>
            polylineCoordinates.add(LatLng(point.latitude, point.longitude)),
      );
      setState(() {});
    }
  }

  void setCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, "images/pin.png")
        .then((icon) {
      sourceIcon = icon;
    });
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, "images/pin.png")
        .then((icon) {
      destinationIcon = icon;
    });
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, "images/user.png")
        .then((icon) {
      currentLocationIcon = icon;
    });
  }

  @override
  void initState() {
    getCurrentLocation();
    setCustomMarkerIcon();
    // getPolyPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CircularMenu(
        alignment: Alignment.bottomLeft,
        items: [
          CircularMenuItem(
            onTap: () {},
            icon: Icons.map,
            color: Colors.green,
          ),
          CircularMenuItem(
            onTap: () {},
            icon: Icons.flutter_dash_rounded,
            color: Colors.blue,
          ),
          CircularMenuItem(
            onTap: () {},
            icon: Icons.safety_check,
            color: Colors.red,
          )
        ],
        backgroundWidget: GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: CameraPosition(
            target:
                LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
            zoom: 14.4746,
          ),
          polylines: {
            Polyline(
                polylineId: const PolylineId("route"),
                points: polylineCoordinates,
                color: Colors.black,
                width: 6)
          },
          markers: {
            Marker(
              markerId: const MarkerId("currentLocation"),
              icon: currentLocationIcon,
              position: LatLng(
                  currentLocation!.latitude!, currentLocation!.longitude!),
            ),
            Marker(
              markerId: const MarkerId("source"),
              icon: sourceIcon,
              position: sourceLocation,
            ),
            Marker(
                markerId: MarkerId("destination"),
                icon: destinationIcon,
                position: destination)
          },
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
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
