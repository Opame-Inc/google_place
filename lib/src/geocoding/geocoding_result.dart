import 'package:google_place/src/models/address_component.dart';
import 'package:google_place/src/models/geometry.dart';
import 'package:google_place/src/models/plus_code.dart';

class GeocodingResult {
  /// [addressComponents] is an array containing the separate components applicable to this address.
  final List<AddressComponent>? addressComponents;

  /// [formattedAddress] is a string containing the human-readable address of this place.
  final String? formattedAddress;

  /// [geometry] contains Geometry object.
  final Geometry? geometry;

  /// [id] contains id.
  final String? id;

  /// [placeId] A textual identifier that uniquely identifies a place. To retrieve information about the place,
  /// pass this identifier in the placeId field of a Places API request. For more information about place IDs.
  final String? placeId;

  /// [plusCode] is an encoded location reference, derived from latitude and longitude coordinates,
  /// that represents an area: 1/8000th of a degree by 1/8000th of a degree (about 14m x 14m at the equator) or smaller.
  /// Plus codes can be used as a replacement for street addresses in places where they do not exist
  /// (where buildings are not numbered or streets are not named).
  final PlusCode? plusCode;


  /// [permanentlyClosed] is a boolean flag indicating whether the place has shut down either permanently
  /// or temporarily (value true). If the place is operational, or if no data is available, the flag is absent from the response.
  @Deprecated(
      'permanently_closed is now deprecated. Instead, use business_status to get the operational status of businesses.')
  final bool? permanentlyClosed;

  GeocodingResult({
    this.addressComponents,
    this.formattedAddress,
    this.geometry,
    this.id,
    this.placeId,
    this.plusCode,
    this.permanentlyClosed,
  });

  factory GeocodingResult.fromJson(Map<String, dynamic> json) {
    return GeocodingResult(
      addressComponents: json['address_components'] != null
          ? json['address_components']
          .map<AddressComponent>((json) => AddressComponent.fromJson(json))
          .toList()
          : null,
      formattedAddress: json['formatted_address'],
      geometry:
      json['geometry'] != null ? Geometry.fromJson(json['geometry']) : null,
      id: json['id'],
      placeId: json['place_id'],
      plusCode: json['plus_code'] != null
          ? PlusCode.fromJson(json['plus_code'])
          : null,
    );
  }
}
