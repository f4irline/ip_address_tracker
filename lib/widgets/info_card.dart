import 'package:flutter/material.dart';
import 'package:ip_address_tracker/models/location_info.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key, this.locationInfo}) : super(key: key);

  final LocationInfo? locationInfo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 300),
        scale: locationInfo == null ? 0 : 1,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: locationInfo == null
                ? []
                : [
                    Column(
                      children: [
                        Text(
                          'IP Address'.toUpperCase(),
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          locationInfo!.ip,
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
                          '${locationInfo!.location.city}, ${locationInfo!.location.region}'
                          '${locationInfo!.location.postalCode.isNotEmpty ? ', ${locationInfo!.location.postalCode}' : ''}',
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
                          locationInfo!.location.timezone,
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
                          locationInfo!.as != null &&
                                  locationInfo!.as!.name.isNotEmpty
                              ? locationInfo!.as!.name
                              : locationInfo!.isp,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ]
                    .map(
                      (col) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: col,
                      ),
                    )
                    .toList(),
          ),
        ),
      ),
    );
  }
}
