import 'package:google_place/google_place.dart';
import 'package:google_place/src/geocoding/geocoding_response.dart';
import 'package:google_place/src/utils/network_utility.dart';

class Geocoding {
  static final _authority = 'maps.googleapis.com';
  static final _unencodedPath = 'maps/api/geocode/json';
  final String apiKEY;
  final Map<String, String> headers;
  final String? proxyUrl;

  Geocoding(this.apiKEY, this.headers, this.proxyUrl);


  Future<GeocodingResponse?> get(
      String placeId
      ) async {
    assert(placeId != "");
    var queryParameters = _createParameters(
      apiKEY,
      placeId,
    );
    var uri = NetworkUtility.createUri(
      proxyUrl,
      _authority,
      _unencodedPath,
      queryParameters,
    );
    var response = await NetworkUtility.fetchUrl(uri, headers: headers);
    if (response != null) {
      return GeocodingResponse.parseGeocodingResult(response);
    }
    return null;
  }
  /// [placeId] Required parameters - A textual identifier that uniquely identifies a place,
  /// returned from a Place Search. For more information about place IDs.

  Future<String?> getJson(
      String placeId
      ) async {
    assert(placeId != "");
    var queryParameters = _createParameters(
      apiKEY,
      placeId,
    );

    var uri = Uri.https(
      proxyUrl != null && proxyUrl != '' ? proxyUrl! : _authority,
      proxyUrl != null && proxyUrl != ''
          ? 'https://$_authority/$_unencodedPath'
          : _unencodedPath,
      queryParameters,
    );
    return await NetworkUtility.fetchUrl(uri, headers: headers);
  }

  /// Prepare query Parameters
  Map<String, String> _createParameters(
      String apiKEY,
      String placeId,
      ) {
    Map<String, String> queryParameters = {
      'key': apiKEY,
      'place_id': placeId,
    };

    return queryParameters;
  }
}
