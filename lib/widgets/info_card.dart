import 'package:flutter/material.dart';

class InfoCard extends StatefulWidget {
  const InfoCard({Key? key}) : super(key: key);

  @override
  _InfoCardState createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(vertical: 15),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Column(
              children: [
                Text(
                  'IP Address'.toUpperCase(),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                const SizedBox(height: 5),
                Text(
                  '192.168.10.1',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'Location'.toUpperCase(),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                const SizedBox(height: 5),
                Text(
                  'Brooklyn, NY 10001',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'Timezone'.toUpperCase(),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                const SizedBox(height: 5),
                Text(
                  'UTC-05:00',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'ISP'.toUpperCase(),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                const SizedBox(height: 5),
                Text(
                  'SpaceX Starlink',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ]
              .map(
                (col) => Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: col,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
