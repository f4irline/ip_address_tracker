class LocationInfo {
  final String ip;
  final String isp;
  final Location location;

  LocationInfo({
    required this.ip,
    required this.isp,
    required this.location,
  });

  factory LocationInfo.fromJson(Map<String, dynamic> json) {
    return LocationInfo(
      ip: json['ip'],
      isp: json['isp'],
      location: json['location'],
    );
  }
}

class Location {
  final String country;
  final String city;
  final String postalCode;
  final String timezone;
  final double lat;
  final double lng;

  Location({
    required this.country,
    required this.city,
    required this.postalCode,
    required this.timezone,
    required this.lat,
    required this.lng,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      country: json['country'],
      city: json['city'],
      postalCode: json['postalCode'],
      timezone: json['timezone'],
      lat: json['lat'],
      lng: json['lng'],
    );
  }
}
