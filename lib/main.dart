import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:ip_address_tracker/models/location_info.dart';
import 'package:ip_address_tracker/services/ip_address_api.dart';
import 'package:ip_address_tracker/widgets/header.dart';
import 'package:ip_address_tracker/widgets/info_card.dart';
import 'package:ip_address_tracker/widgets/ip_input.dart';
import 'package:ip_address_tracker/widgets/leaflet_map.dart';
import 'package:ip_address_tracker/widgets/loader.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(const IpAddressTracker());
}

class IpAddressTracker extends StatelessWidget {
  const IpAddressTracker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          headline1: const TextStyle(
            fontFamily: 'Rubik',
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          bodyText1: TextStyle(
            fontFamily: 'Rubik',
            fontSize: 14.0,
            color: const HSLColor.fromAHSL(1, 0, 0, 0.17).toColor(),
            fontWeight: FontWeight.w600,
          ),
          bodyText2: TextStyle(
            fontFamily: 'Rubik',
            fontSize: 9,
            color: const HSLColor.fromAHSL(1, 0, 0, 0.59).toColor(),
            fontWeight: FontWeight.w600,
            letterSpacing: 1.1,
          ),
        ),
      ),
      home: const MainView(),
    );
  }
}

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  LocationInfo? _locationInfo;
  bool _loading = false;
  late final MapController _mapController;
  late final IpAddressApiService _ipAddressApiService;

  void getLocationInfo(BuildContext ctx, String ipAddress) {
    setState(() {
      _loading = true;
    });
    _ipAddressApiService.getIpAddressData(ipAddress).then((info) {
      setState(() {
        _locationInfo = info;
        _mapController.move(
          LatLng(
            // Offset to show the location pointer icon properly without it
            // appearing under the info card
            info.location.lat + 0.0001,
            info.location.lng,
          ),
          18.0,
        );
      });
    }).catchError((err) {
      setState(() {
        _locationInfo = null;
        ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
          content: Text(
            'Couldn\'t find location info by given IP address.',
            style: TextStyle(color: Colors.white),
          ),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ));
      });
      throw err;
    }).whenComplete(() {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _ipAddressApiService = IpAddressApiService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                const Header(),
                LeafletMap(
                  mapController: _mapController,
                  locationInfo: _locationInfo,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  Text(
                    'IP Address Tracker',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  IpInput(
                    setIpAddress: ((String text) {
                      getLocationInfo(context, text);
                    }),
                  ),
                  InfoCard(locationInfo: _locationInfo),
                ],
              ),
            ),
            _loading ? const Loader() : Container(),
          ],
        ),
      ),
    );
  }
}
