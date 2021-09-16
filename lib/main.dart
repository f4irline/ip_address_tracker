import 'package:flutter/material.dart';
import 'package:ip_address_tracker/widgets/header.dart';
import 'package:ip_address_tracker/widgets/leaflet_map.dart';

void main() {
  runApp(const IpAddressTracker());
}

class IpAddressTracker extends StatelessWidget {
  const IpAddressTracker({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Header(),
          LeafletMap(),
        ],
      ),
    );
  }
}
