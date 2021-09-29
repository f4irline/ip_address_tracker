import 'package:http/http.dart';
import 'dart:convert';

import 'package:ip_address_tracker/models/location_info.dart';

const apiKey = String.fromEnvironment('IPIFY_API_KEY');

class IpAddressApiService {
  final String apiUrl = 'https://geo.ipify.org/api/v1?apiKey=$apiKey&ipAddress';

  Future<LocationInfo> getIpAddressData(String ipAddress) async {
    Response res = await get(Uri.parse("$apiUrl=$ipAddress"));

    if (res.statusCode == 200) {
      return LocationInfo.fromJson(jsonDecode(res.body));
    } else {
      throw "Unable to retrieve location info.";
    }
  }
}
