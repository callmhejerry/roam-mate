/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../dto/property.dart' as _i2;
import '../dto/amenties.dart' as _i3;

abstract class PropertyAmenitites implements _i1.SerializableModel {
  PropertyAmenitites._({
    this.id,
    required this.propertyId,
    this.property,
    required this.amenityId,
    this.amenity,
  });

  factory PropertyAmenitites({
    int? id,
    required int propertyId,
    _i2.Property? property,
    required int amenityId,
    _i3.Amenity? amenity,
  }) = _PropertyAmenititesImpl;

  factory PropertyAmenitites.fromJson(Map<String, dynamic> jsonSerialization) {
    return PropertyAmenitites(
      id: jsonSerialization['id'] as int?,
      propertyId: jsonSerialization['propertyId'] as int,
      property: jsonSerialization['property'] == null
          ? null
          : _i2.Property.fromJson(
              (jsonSerialization['property'] as Map<String, dynamic>)),
      amenityId: jsonSerialization['amenityId'] as int,
      amenity: jsonSerialization['amenity'] == null
          ? null
          : _i3.Amenity.fromJson(
              (jsonSerialization['amenity'] as Map<String, dynamic>)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int propertyId;

  _i2.Property? property;

  int amenityId;

  _i3.Amenity? amenity;

  PropertyAmenitites copyWith({
    int? id,
    int? propertyId,
    _i2.Property? property,
    int? amenityId,
    _i3.Amenity? amenity,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'propertyId': propertyId,
      if (property != null) 'property': property?.toJson(),
      'amenityId': amenityId,
      if (amenity != null) 'amenity': amenity?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PropertyAmenititesImpl extends PropertyAmenitites {
  _PropertyAmenititesImpl({
    int? id,
    required int propertyId,
    _i2.Property? property,
    required int amenityId,
    _i3.Amenity? amenity,
  }) : super._(
          id: id,
          propertyId: propertyId,
          property: property,
          amenityId: amenityId,
          amenity: amenity,
        );

  @override
  PropertyAmenitites copyWith({
    Object? id = _Undefined,
    int? propertyId,
    Object? property = _Undefined,
    int? amenityId,
    Object? amenity = _Undefined,
  }) {
    return PropertyAmenitites(
      id: id is int? ? id : this.id,
      propertyId: propertyId ?? this.propertyId,
      property:
          property is _i2.Property? ? property : this.property?.copyWith(),
      amenityId: amenityId ?? this.amenityId,
      amenity: amenity is _i3.Amenity? ? amenity : this.amenity?.copyWith(),
    );
  }
}
