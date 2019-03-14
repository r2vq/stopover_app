import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const double MAP_ZOOM = 15.0;
const String MARKER_ID = "01";

class LocationMap extends StatefulWidget {
  final String _markerLatPosition;
  final String _markerLongPosition;

  const LocationMap(this._markerLatPosition, this._markerLongPosition);

  @override
  State<StatefulWidget> createState() => _LocationMapState();
}

class _LocationMapState extends State<LocationMap> {
  // YYZ, Pearson Int'l Airport
  static CameraPosition initialCameraPosition =
  _createCameraPosition(43.6777, -79.6248);

  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    markers.add(Marker(
      markerId: MarkerId(MARKER_ID),
      position: LatLng(double.parse(widget._markerLatPosition), double.parse(widget._markerLongPosition)),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: initialCameraPosition,
        markers: markers,
      ),
    );
  }

  static CameraPosition _createCameraPosition(double latitude,
      double longitude) {
    return CameraPosition(
      target: LatLng(latitude, longitude),
      zoom: MAP_ZOOM,
    );
  }
}