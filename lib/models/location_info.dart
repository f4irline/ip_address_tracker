class LocationInfo {
  final String ip;
  final String isp;
  final Location location;
  final AutonomousSystem? as;

  LocationInfo({
    required this.ip,
    required this.isp,
    required this.location,
    this.as,
  });

  factory LocationInfo.fromJson(Map<String, dynamic> json) {
    return LocationInfo(
      ip: json['ip'],
      isp: json['isp'],
      location: Location.fromJson(json['location']),
      as: AutonomousSystem.fromJson(json['as']),
    );
  }
}

class Location {
  final String country;
  final String city;
  final String region;
  final String postalCode;
  final String timezone;
  final double lat;
  final double lng;

  Location({
    required this.country,
    required this.city,
    required this.region,
    required this.postalCode,
    required this.timezone,
    required this.lat,
    required this.lng,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      country: json['country'],
      city: json['city'],
      region: json['region'],
      postalCode: json['postalCode'],
      timezone: json['timezone'],
      lat: json['lat'],
      lng: json['lng'],
    );
  }
}

class AutonomousSystem {
  final String name;

  AutonomousSystem({
    required this.name,
  });

  factory AutonomousSystem.fromJson(Map<String, dynamic> json) {
    return AutonomousSystem(name: json['name']);
  }
}
