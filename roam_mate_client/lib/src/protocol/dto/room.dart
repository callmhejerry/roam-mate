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
import '../enums/room_type_enum.dart' as _i2;
import '../enums/gender_enum.dart' as _i3;
import '../dto/room_amenities.dart' as _i4;

abstract class Room implements _i1.SerializableModel {
  Room._({
    this.id,
    required this.address,
    required this.lat,
    required this.long,
    required this.roomType,
    required this.preferredGender,
    required this.numberOfRoomMate,
    this.amenities,
    required this.roomRules,
    required this.rent,
    required this.photos,
    required this.title,
    required this.description,
  });

  factory Room({
    int? id,
    required String address,
    required double lat,
    required double long,
    required _i2.RoomType roomType,
    required _i3.Gender preferredGender,
    required int numberOfRoomMate,
    List<_i4.RoomAmenitites>? amenities,
    required List<String> roomRules,
    required double rent,
    required List<String> photos,
    required String title,
    required String description,
  }) = _RoomImpl;

  factory Room.fromJson(Map<String, dynamic> jsonSerialization) {
    return Room(
      id: jsonSerialization['id'] as int?,
      address: jsonSerialization['address'] as String,
      lat: (jsonSerialization['lat'] as num).toDouble(),
      long: (jsonSerialization['long'] as num).toDouble(),
      roomType:
          _i2.RoomType.fromJson((jsonSerialization['roomType'] as String)),
      preferredGender:
          _i3.Gender.fromJson((jsonSerialization['preferredGender'] as String)),
      numberOfRoomMate: jsonSerialization['numberOfRoomMate'] as int,
      amenities: (jsonSerialization['amenities'] as List?)
          ?.map((e) => _i4.RoomAmenitites.fromJson((e as Map<String, dynamic>)))
          .toList(),
      roomRules: (jsonSerialization['roomRules'] as List)
          .map((e) => e as String)
          .toList(),
      rent: (jsonSerialization['rent'] as num).toDouble(),
      photos: (jsonSerialization['photos'] as List)
          .map((e) => e as String)
          .toList(),
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String address;

  double lat;

  double long;

  _i2.RoomType roomType;

  _i3.Gender preferredGender;

  int numberOfRoomMate;

  List<_i4.RoomAmenitites>? amenities;

  List<String> roomRules;

  double rent;

  List<String> photos;

  String title;

  String description;

  Room copyWith({
    int? id,
    String? address,
    double? lat,
    double? long,
    _i2.RoomType? roomType,
    _i3.Gender? preferredGender,
    int? numberOfRoomMate,
    List<_i4.RoomAmenitites>? amenities,
    List<String>? roomRules,
    double? rent,
    List<String>? photos,
    String? title,
    String? description,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'address': address,
      'lat': lat,
      'long': long,
      'roomType': roomType.toJson(),
      'preferredGender': preferredGender.toJson(),
      'numberOfRoomMate': numberOfRoomMate,
      if (amenities != null)
        'amenities': amenities?.toJson(valueToJson: (v) => v.toJson()),
      'roomRules': roomRules.toJson(),
      'rent': rent,
      'photos': photos.toJson(),
      'title': title,
      'description': description,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RoomImpl extends Room {
  _RoomImpl({
    int? id,
    required String address,
    required double lat,
    required double long,
    required _i2.RoomType roomType,
    required _i3.Gender preferredGender,
    required int numberOfRoomMate,
    List<_i4.RoomAmenitites>? amenities,
    required List<String> roomRules,
    required double rent,
    required List<String> photos,
    required String title,
    required String description,
  }) : super._(
          id: id,
          address: address,
          lat: lat,
          long: long,
          roomType: roomType,
          preferredGender: preferredGender,
          numberOfRoomMate: numberOfRoomMate,
          amenities: amenities,
          roomRules: roomRules,
          rent: rent,
          photos: photos,
          title: title,
          description: description,
        );

  @override
  Room copyWith({
    Object? id = _Undefined,
    String? address,
    double? lat,
    double? long,
    _i2.RoomType? roomType,
    _i3.Gender? preferredGender,
    int? numberOfRoomMate,
    Object? amenities = _Undefined,
    List<String>? roomRules,
    double? rent,
    List<String>? photos,
    String? title,
    String? description,
  }) {
    return Room(
      id: id is int? ? id : this.id,
      address: address ?? this.address,
      lat: lat ?? this.lat,
      long: long ?? this.long,
      roomType: roomType ?? this.roomType,
      preferredGender: preferredGender ?? this.preferredGender,
      numberOfRoomMate: numberOfRoomMate ?? this.numberOfRoomMate,
      amenities: amenities is List<_i4.RoomAmenitites>?
          ? amenities
          : this.amenities?.map((e0) => e0.copyWith()).toList(),
      roomRules: roomRules ?? this.roomRules.map((e0) => e0).toList(),
      rent: rent ?? this.rent,
      photos: photos ?? this.photos.map((e0) => e0).toList(),
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }
}
