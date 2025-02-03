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
import '../dto/room.dart' as _i2;
import '../dto/amenties.dart' as _i3;

abstract class RoomAmenitites implements _i1.SerializableModel {
  RoomAmenitites._({
    this.id,
    required this.roomId,
    this.room,
    required this.amenityId,
    this.amenity,
  });

  factory RoomAmenitites({
    int? id,
    required int roomId,
    _i2.Room? room,
    required int amenityId,
    _i3.Amenity? amenity,
  }) = _RoomAmenititesImpl;

  factory RoomAmenitites.fromJson(Map<String, dynamic> jsonSerialization) {
    return RoomAmenitites(
      id: jsonSerialization['id'] as int?,
      roomId: jsonSerialization['roomId'] as int,
      room: jsonSerialization['room'] == null
          ? null
          : _i2.Room.fromJson(
              (jsonSerialization['room'] as Map<String, dynamic>)),
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

  int roomId;

  _i2.Room? room;

  int amenityId;

  _i3.Amenity? amenity;

  RoomAmenitites copyWith({
    int? id,
    int? roomId,
    _i2.Room? room,
    int? amenityId,
    _i3.Amenity? amenity,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'roomId': roomId,
      if (room != null) 'room': room?.toJson(),
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

class _RoomAmenititesImpl extends RoomAmenitites {
  _RoomAmenititesImpl({
    int? id,
    required int roomId,
    _i2.Room? room,
    required int amenityId,
    _i3.Amenity? amenity,
  }) : super._(
          id: id,
          roomId: roomId,
          room: room,
          amenityId: amenityId,
          amenity: amenity,
        );

  @override
  RoomAmenitites copyWith({
    Object? id = _Undefined,
    int? roomId,
    Object? room = _Undefined,
    int? amenityId,
    Object? amenity = _Undefined,
  }) {
    return RoomAmenitites(
      id: id is int? ? id : this.id,
      roomId: roomId ?? this.roomId,
      room: room is _i2.Room? ? room : this.room?.copyWith(),
      amenityId: amenityId ?? this.amenityId,
      amenity: amenity is _i3.Amenity? ? amenity : this.amenity?.copyWith(),
    );
  }
}
