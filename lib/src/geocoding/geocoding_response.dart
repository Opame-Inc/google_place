import 'dart:convert';

import 'package:google_place/src/geocoding/geocoding_result.dart';

/// The Geocode response contains results and status
class GeocodingResponse {
  final String? status;
  final GeocodingResult? result;

  GeocodingResponse({
    this.status,
    this.result,
  });

  factory GeocodingResponse.fromJson(Map<String, dynamic> json) {
    return GeocodingResponse(
      status: json['status'],
      result: json['results'][0] != null
          ? GeocodingResult.fromJson(json['results'][0])
          : null,
    );
  }

  static GeocodingResponse parseGeocodingResult(String responseBody) {
    final parsed = json.decode(responseBody).cast<String, dynamic>();
    return GeocodingResponse.fromJson(parsed);
  }
}
