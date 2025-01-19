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
import '../enums/property_type_enum.dart' as _i2;

abstract class Property implements _i1.SerializableModel {
  Property._({
    this.id,
    required this.location,
    required this.price,
    required this.roomType,
    required this.title,
    required this.description,
    required this.image,
    required this.otherImages,
    this.video,
    this.numberOfRooms,
    required this.verified,
    required this.propertyOwnerName,
    this.propertyOwnerEmail,
    required this.propertyOwnerPhoneNumber,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Property({
    int? id,
    required String location,
    required double price,
    required _i2.PropertyType roomType,
    required String title,
    required String description,
    required String image,
    required String otherImages,
    String? video,
    int? numberOfRooms,
    required bool verified,
    required String propertyOwnerName,
    String? propertyOwnerEmail,
    required String propertyOwnerPhoneNumber,
    required double latitude,
    required double longitude,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _PropertyImpl;

  factory Property.fromJson(Map<String, dynamic> jsonSerialization) {
    return Property(
      id: jsonSerialization['id'] as int?,
      location: jsonSerialization['location'] as String,
      price: (jsonSerialization['price'] as num).toDouble(),
      roomType:
          _i2.PropertyType.fromJson((jsonSerialization['roomType'] as String)),
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      image: jsonSerialization['image'] as String,
      otherImages: jsonSerialization['otherImages'] as String,
      video: jsonSerialization['video'] as String?,
      numberOfRooms: jsonSerialization['numberOfRooms'] as int?,
      verified: jsonSerialization['verified'] as bool,
      propertyOwnerName: jsonSerialization['propertyOwnerName'] as String,
      propertyOwnerEmail: jsonSerialization['propertyOwnerEmail'] as String?,
      propertyOwnerPhoneNumber:
          jsonSerialization['propertyOwnerPhoneNumber'] as String,
      latitude: (jsonSerialization['latitude'] as num).toDouble(),
      longitude: (jsonSerialization['longitude'] as num).toDouble(),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String location;

  double price;

  _i2.PropertyType roomType;

  String title;

  String description;

  String image;

  String otherImages;

  String? video;

  int? numberOfRooms;

  bool verified;

  String propertyOwnerName;

  String? propertyOwnerEmail;

  String propertyOwnerPhoneNumber;

  double latitude;

  double longitude;

  DateTime createdAt;

  DateTime updatedAt;

  Property copyWith({
    int? id,
    String? location,
    double? price,
    _i2.PropertyType? roomType,
    String? title,
    String? description,
    String? image,
    String? otherImages,
    String? video,
    int? numberOfRooms,
    bool? verified,
    String? propertyOwnerName,
    String? propertyOwnerEmail,
    String? propertyOwnerPhoneNumber,
    double? latitude,
    double? longitude,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'location': location,
      'price': price,
      'roomType': roomType.toJson(),
      'title': title,
      'description': description,
      'image': image,
      'otherImages': otherImages,
      if (video != null) 'video': video,
      if (numberOfRooms != null) 'numberOfRooms': numberOfRooms,
      'verified': verified,
      'propertyOwnerName': propertyOwnerName,
      if (propertyOwnerEmail != null) 'propertyOwnerEmail': propertyOwnerEmail,
      'propertyOwnerPhoneNumber': propertyOwnerPhoneNumber,
      'latitude': latitude,
      'longitude': longitude,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PropertyImpl extends Property {
  _PropertyImpl({
    int? id,
    required String location,
    required double price,
    required _i2.PropertyType roomType,
    required String title,
    required String description,
    required String image,
    required String otherImages,
    String? video,
    int? numberOfRooms,
    required bool verified,
    required String propertyOwnerName,
    String? propertyOwnerEmail,
    required String propertyOwnerPhoneNumber,
    required double latitude,
    required double longitude,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
          id: id,
          location: location,
          price: price,
          roomType: roomType,
          title: title,
          description: description,
          image: image,
          otherImages: otherImages,
          video: video,
          numberOfRooms: numberOfRooms,
          verified: verified,
          propertyOwnerName: propertyOwnerName,
          propertyOwnerEmail: propertyOwnerEmail,
          propertyOwnerPhoneNumber: propertyOwnerPhoneNumber,
          latitude: latitude,
          longitude: longitude,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  @override
  Property copyWith({
    Object? id = _Undefined,
    String? location,
    double? price,
    _i2.PropertyType? roomType,
    String? title,
    String? description,
    String? image,
    String? otherImages,
    Object? video = _Undefined,
    Object? numberOfRooms = _Undefined,
    bool? verified,
    String? propertyOwnerName,
    Object? propertyOwnerEmail = _Undefined,
    String? propertyOwnerPhoneNumber,
    double? latitude,
    double? longitude,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Property(
      id: id is int? ? id : this.id,
      location: location ?? this.location,
      price: price ?? this.price,
      roomType: roomType ?? this.roomType,
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      otherImages: otherImages ?? this.otherImages,
      video: video is String? ? video : this.video,
      numberOfRooms: numberOfRooms is int? ? numberOfRooms : this.numberOfRooms,
      verified: verified ?? this.verified,
      propertyOwnerName: propertyOwnerName ?? this.propertyOwnerName,
      propertyOwnerEmail: propertyOwnerEmail is String?
          ? propertyOwnerEmail
          : this.propertyOwnerEmail,
      propertyOwnerPhoneNumber:
          propertyOwnerPhoneNumber ?? this.propertyOwnerPhoneNumber,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
