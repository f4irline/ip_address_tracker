import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ip_address_tracker/models/location_info.dart';
import 'package:latlong2/latlong.dart';

class LeafletMap extends StatelessWidget {
  const LeafletMap({
    Key? key,
    required this.mapController,
    this.locationInfo,
  }) : super(key: key);
  final MapController mapController;
  final LocationInfo? locationInfo;

  @override
  Widget build(BuildContext context) {
    List<Marker> markers = locationInfo != null
        ? [
            Marker(
              width: 46.0,
              height: 56.0,
              point: LatLng(
                  locationInfo!.location.lat, locationInfo!.location.lng),
              builder: (ctx) =>
                  SvgPicture.asset('assets/icons/icon-location.svg'),
            ),
          ]
        : [];
    return Flexible(
      child: FlutterMap(
        mapController: mapController,
        options: MapOptions(
          center: LatLng(0, 0),
          zoom: 3.0,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayerOptions(
            markers: markers,
          ),
        ],
      ),
    );
  }
}
