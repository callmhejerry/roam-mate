/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../enums/room_type_enum.dart' as _i2;
import '../enums/gender_enum.dart' as _i3;
import '../dto/room_amenities.dart' as _i4;

abstract class Room implements _i1.TableRow, _i1.ProtocolSerialization {
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

  static final t = RoomTable();

  static const db = RoomRepository._();

  @override
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

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'address': address,
      'lat': lat,
      'long': long,
      'roomType': roomType.toJson(),
      'preferredGender': preferredGender.toJson(),
      'numberOfRoomMate': numberOfRoomMate,
      if (amenities != null)
        'amenities':
            amenities?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'roomRules': roomRules.toJson(),
      'rent': rent,
      'photos': photos.toJson(),
      'title': title,
      'description': description,
    };
  }

  static RoomInclude include({_i4.RoomAmenititesIncludeList? amenities}) {
    return RoomInclude._(amenities: amenities);
  }

  static RoomIncludeList includeList({
    _i1.WhereExpressionBuilder<RoomTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RoomTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RoomTable>? orderByList,
    RoomInclude? include,
  }) {
    return RoomIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Room.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Room.t),
      include: include,
    );
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

class RoomTable extends _i1.Table {
  RoomTable({super.tableRelation}) : super(tableName: 'room') {
    address = _i1.ColumnString(
      'address',
      this,
    );
    lat = _i1.ColumnDouble(
      'lat',
      this,
    );
    long = _i1.ColumnDouble(
      'long',
      this,
    );
    roomType = _i1.ColumnEnum(
      'roomType',
      this,
      _i1.EnumSerialization.byName,
    );
    preferredGender = _i1.ColumnEnum(
      'preferredGender',
      this,
      _i1.EnumSerialization.byName,
    );
    numberOfRoomMate = _i1.ColumnInt(
      'numberOfRoomMate',
      this,
    );
    roomRules = _i1.ColumnSerializable(
      'roomRules',
      this,
    );
    rent = _i1.ColumnDouble(
      'rent',
      this,
    );
    photos = _i1.ColumnSerializable(
      'photos',
      this,
    );
    title = _i1.ColumnString(
      'title',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
  }

  late final _i1.ColumnString address;

  late final _i1.ColumnDouble lat;

  late final _i1.ColumnDouble long;

  late final _i1.ColumnEnum<_i2.RoomType> roomType;

  late final _i1.ColumnEnum<_i3.Gender> preferredGender;

  late final _i1.ColumnInt numberOfRoomMate;

  _i4.RoomAmenititesTable? ___amenities;

  _i1.ManyRelation<_i4.RoomAmenititesTable>? _amenities;

  late final _i1.ColumnSerializable roomRules;

  late final _i1.ColumnDouble rent;

  late final _i1.ColumnSerializable photos;

  late final _i1.ColumnString title;

  late final _i1.ColumnString description;

  _i4.RoomAmenititesTable get __amenities {
    if (___amenities != null) return ___amenities!;
    ___amenities = _i1.createRelationTable(
      relationFieldName: '__amenities',
      field: Room.t.id,
      foreignField: _i4.RoomAmenitites.t.roomId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.RoomAmenititesTable(tableRelation: foreignTableRelation),
    );
    return ___amenities!;
  }

  _i1.ManyRelation<_i4.RoomAmenititesTable> get amenities {
    if (_amenities != null) return _amenities!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'amenities',
      field: Room.t.id,
      foreignField: _i4.RoomAmenitites.t.roomId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.RoomAmenititesTable(tableRelation: foreignTableRelation),
    );
    _amenities = _i1.ManyRelation<_i4.RoomAmenititesTable>(
      tableWithRelations: relationTable,
      table: _i4.RoomAmenititesTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _amenities!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        address,
        lat,
        long,
        roomType,
        preferredGender,
        numberOfRoomMate,
        roomRules,
        rent,
        photos,
        title,
        description,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'amenities') {
      return __amenities;
    }
    return null;
  }
}

class RoomInclude extends _i1.IncludeObject {
  RoomInclude._({_i4.RoomAmenititesIncludeList? amenities}) {
    _amenities = amenities;
  }

  _i4.RoomAmenititesIncludeList? _amenities;

  @override
  Map<String, _i1.Include?> get includes => {'amenities': _amenities};

  @override
  _i1.Table get table => Room.t;
}

class RoomIncludeList extends _i1.IncludeList {
  RoomIncludeList._({
    _i1.WhereExpressionBuilder<RoomTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Room.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Room.t;
}

class RoomRepository {
  const RoomRepository._();

  final attach = const RoomAttachRepository._();

  final attachRow = const RoomAttachRowRepository._();

  final detach = const RoomDetachRepository._();

  final detachRow = const RoomDetachRowRepository._();

  Future<List<Room>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RoomTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RoomTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RoomTable>? orderByList,
    _i1.Transaction? transaction,
    RoomInclude? include,
  }) async {
    return session.db.find<Room>(
      where: where?.call(Room.t),
      orderBy: orderBy?.call(Room.t),
      orderByList: orderByList?.call(Room.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Room?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RoomTable>? where,
    int? offset,
    _i1.OrderByBuilder<RoomTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RoomTable>? orderByList,
    _i1.Transaction? transaction,
    RoomInclude? include,
  }) async {
    return session.db.findFirstRow<Room>(
      where: where?.call(Room.t),
      orderBy: orderBy?.call(Room.t),
      orderByList: orderByList?.call(Room.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Room?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    RoomInclude? include,
  }) async {
    return session.db.findById<Room>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<Room>> insert(
    _i1.Session session,
    List<Room> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Room>(
      rows,
      transaction: transaction,
    );
  }

  Future<Room> insertRow(
    _i1.Session session,
    Room row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Room>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Room>> update(
    _i1.Session session,
    List<Room> rows, {
    _i1.ColumnSelections<RoomTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Room>(
      rows,
      columns: columns?.call(Room.t),
      transaction: transaction,
    );
  }

  Future<Room> updateRow(
    _i1.Session session,
    Room row, {
    _i1.ColumnSelections<RoomTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Room>(
      row,
      columns: columns?.call(Room.t),
      transaction: transaction,
    );
  }

  Future<List<Room>> delete(
    _i1.Session session,
    List<Room> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Room>(
      rows,
      transaction: transaction,
    );
  }

  Future<Room> deleteRow(
    _i1.Session session,
    Room row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Room>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Room>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<RoomTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Room>(
      where: where(Room.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RoomTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Room>(
      where: where?.call(Room.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class RoomAttachRepository {
  const RoomAttachRepository._();

  Future<void> amenities(
    _i1.Session session,
    Room room,
    List<_i4.RoomAmenitites> roomAmenitites, {
    _i1.Transaction? transaction,
  }) async {
    if (roomAmenitites.any((e) => e.id == null)) {
      throw ArgumentError.notNull('roomAmenitites.id');
    }
    if (room.id == null) {
      throw ArgumentError.notNull('room.id');
    }

    var $roomAmenitites =
        roomAmenitites.map((e) => e.copyWith(roomId: room.id)).toList();
    await session.db.update<_i4.RoomAmenitites>(
      $roomAmenitites,
      columns: [_i4.RoomAmenitites.t.roomId],
      transaction: transaction,
    );
  }
}

class RoomAttachRowRepository {
  const RoomAttachRowRepository._();

  Future<void> amenities(
    _i1.Session session,
    Room room,
    _i4.RoomAmenitites roomAmenitites, {
    _i1.Transaction? transaction,
  }) async {
    if (roomAmenitites.id == null) {
      throw ArgumentError.notNull('roomAmenitites.id');
    }
    if (room.id == null) {
      throw ArgumentError.notNull('room.id');
    }

    var $roomAmenitites = roomAmenitites.copyWith(roomId: room.id);
    await session.db.updateRow<_i4.RoomAmenitites>(
      $roomAmenitites,
      columns: [_i4.RoomAmenitites.t.roomId],
      transaction: transaction,
    );
  }
}

class RoomDetachRepository {
  const RoomDetachRepository._();

  Future<void> amenities(
    _i1.Session session,
    List<_i4.RoomAmenitites> roomAmenitites, {
    _i1.Transaction? transaction,
  }) async {
    if (roomAmenitites.any((e) => e.id == null)) {
      throw ArgumentError.notNull('roomAmenitites.id');
    }

    var $roomAmenitites =
        roomAmenitites.map((e) => e.copyWith(roomId: null)).toList();
    await session.db.update<_i4.RoomAmenitites>(
      $roomAmenitites,
      columns: [_i4.RoomAmenitites.t.roomId],
      transaction: transaction,
    );
  }
}

class RoomDetachRowRepository {
  const RoomDetachRowRepository._();

  Future<void> amenities(
    _i1.Session session,
    _i4.RoomAmenitites roomAmenitites, {
    _i1.Transaction? transaction,
  }) async {
    if (roomAmenitites.id == null) {
      throw ArgumentError.notNull('roomAmenitites.id');
    }

    var $roomAmenitites = roomAmenitites.copyWith(roomId: null);
    await session.db.updateRow<_i4.RoomAmenitites>(
      $roomAmenitites,
      columns: [_i4.RoomAmenitites.t.roomId],
      transaction: transaction,
    );
  }
}
