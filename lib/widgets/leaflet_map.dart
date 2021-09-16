import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class LeafletMap extends StatefulWidget {
  const LeafletMap({Key? key}) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<LeafletMap> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FlutterMap(
        options: MapOptions(
          center: LatLng(51.5, -0.09),
          zoom: 13.0,
        ),
        layers: [
          TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c']),
          MarkerLayerOptions(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(51.5, -0.09),
                builder: (ctx) => const FlutterLogo(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
