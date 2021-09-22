import 'package:flutter/material.dart';
import 'package:ip_address_tracker/widgets/header.dart';
import 'package:ip_address_tracker/widgets/info_card.dart';
import 'package:ip_address_tracker/widgets/ip_input.dart';
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
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          headline1: const TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
          bodyText1: TextStyle(
            fontSize: 14.0,
            color: const HSLColor.fromAHSL(1, 0, 0, 0.17).toColor(),
            fontWeight: FontWeight.w700,
          ),
          bodyText2: TextStyle(
            fontSize: 11.0,
            color: const HSLColor.fromAHSL(1, 0, 0, 0.59).toColor(),
            fontWeight: FontWeight.w700,
            letterSpacing: 1.1,
          ),
        ),
      ),
      home: const MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: const [
                Header(),
                LeafletMap(),
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
                  const IpInput(),
                  const InfoCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
