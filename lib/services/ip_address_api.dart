import 'package:http/http.dart';
import 'dart:convert';

import 'package:ip_address_tracker/models/location_info.dart';

class IpAddressApiService {
  final String? apiKey = const String.fromEnvironment('IPIFY_API_KEY');

  Future<LocationInfo> getIpAddressData(String ipAddress) async {
    if (apiKey!.isEmpty) {
      throw "API Key is not defined.";
    }

    String apiUrl = 'https://geo.ipify.org/api/v1?apiKey=$apiKey&ipAddress';

    Response res = await get(Uri.parse("$apiUrl=$ipAddress"));

    if (res.statusCode == 200) {
      return LocationInfo.fromJson(jsonDecode(res.body));
    } else {
      return Future.error("Unable to retrieve location info.");
    }
  }
}
