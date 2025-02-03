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
import '../dto/room.dart' as _i2;
import '../dto/amenties.dart' as _i3;

abstract class RoomAmenitites
    implements _i1.TableRow, _i1.ProtocolSerialization {
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

  static final t = RoomAmenititesTable();

  static const db = RoomAmenititesRepository._();

  @override
  int? id;

  int roomId;

  _i2.Room? room;

  int amenityId;

  _i3.Amenity? amenity;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'roomId': roomId,
      if (room != null) 'room': room?.toJsonForProtocol(),
      'amenityId': amenityId,
      if (amenity != null) 'amenity': amenity?.toJsonForProtocol(),
    };
  }

  static RoomAmenititesInclude include({
    _i2.RoomInclude? room,
    _i3.AmenityInclude? amenity,
  }) {
    return RoomAmenititesInclude._(
      room: room,
      amenity: amenity,
    );
  }

  static RoomAmenititesIncludeList includeList({
    _i1.WhereExpressionBuilder<RoomAmenititesTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RoomAmenititesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RoomAmenititesTable>? orderByList,
    RoomAmenititesInclude? include,
  }) {
    return RoomAmenititesIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RoomAmenitites.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(RoomAmenitites.t),
      include: include,
    );
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

class RoomAmenititesTable extends _i1.Table {
  RoomAmenititesTable({super.tableRelation})
      : super(tableName: 'room_amenities') {
    roomId = _i1.ColumnInt(
      'roomId',
      this,
    );
    amenityId = _i1.ColumnInt(
      'amenityId',
      this,
    );
  }

  late final _i1.ColumnInt roomId;

  _i2.RoomTable? _room;

  late final _i1.ColumnInt amenityId;

  _i3.AmenityTable? _amenity;

  _i2.RoomTable get room {
    if (_room != null) return _room!;
    _room = _i1.createRelationTable(
      relationFieldName: 'room',
      field: RoomAmenitites.t.roomId,
      foreignField: _i2.Room.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.RoomTable(tableRelation: foreignTableRelation),
    );
    return _room!;
  }

  _i3.AmenityTable get amenity {
    if (_amenity != null) return _amenity!;
    _amenity = _i1.createRelationTable(
      relationFieldName: 'amenity',
      field: RoomAmenitites.t.amenityId,
      foreignField: _i3.Amenity.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.AmenityTable(tableRelation: foreignTableRelation),
    );
    return _amenity!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        roomId,
        amenityId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'room') {
      return room;
    }
    if (relationField == 'amenity') {
      return amenity;
    }
    return null;
  }
}

class RoomAmenititesInclude extends _i1.IncludeObject {
  RoomAmenititesInclude._({
    _i2.RoomInclude? room,
    _i3.AmenityInclude? amenity,
  }) {
    _room = room;
    _amenity = amenity;
  }

  _i2.RoomInclude? _room;

  _i3.AmenityInclude? _amenity;

  @override
  Map<String, _i1.Include?> get includes => {
        'room': _room,
        'amenity': _amenity,
      };

  @override
  _i1.Table get table => RoomAmenitites.t;
}

class RoomAmenititesIncludeList extends _i1.IncludeList {
  RoomAmenititesIncludeList._({
    _i1.WhereExpressionBuilder<RoomAmenititesTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(RoomAmenitites.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => RoomAmenitites.t;
}

class RoomAmenititesRepository {
  const RoomAmenititesRepository._();

  final attachRow = const RoomAmenititesAttachRowRepository._();

  Future<List<RoomAmenitites>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RoomAmenititesTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RoomAmenititesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RoomAmenititesTable>? orderByList,
    _i1.Transaction? transaction,
    RoomAmenititesInclude? include,
  }) async {
    return session.db.find<RoomAmenitites>(
      where: where?.call(RoomAmenitites.t),
      orderBy: orderBy?.call(RoomAmenitites.t),
      orderByList: orderByList?.call(RoomAmenitites.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<RoomAmenitites?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RoomAmenititesTable>? where,
    int? offset,
    _i1.OrderByBuilder<RoomAmenititesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RoomAmenititesTable>? orderByList,
    _i1.Transaction? transaction,
    RoomAmenititesInclude? include,
  }) async {
    return session.db.findFirstRow<RoomAmenitites>(
      where: where?.call(RoomAmenitites.t),
      orderBy: orderBy?.call(RoomAmenitites.t),
      orderByList: orderByList?.call(RoomAmenitites.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<RoomAmenitites?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    RoomAmenititesInclude? include,
  }) async {
    return session.db.findById<RoomAmenitites>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<RoomAmenitites>> insert(
    _i1.Session session,
    List<RoomAmenitites> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<RoomAmenitites>(
      rows,
      transaction: transaction,
    );
  }

  Future<RoomAmenitites> insertRow(
    _i1.Session session,
    RoomAmenitites row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<RoomAmenitites>(
      row,
      transaction: transaction,
    );
  }

  Future<List<RoomAmenitites>> update(
    _i1.Session session,
    List<RoomAmenitites> rows, {
    _i1.ColumnSelections<RoomAmenititesTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<RoomAmenitites>(
      rows,
      columns: columns?.call(RoomAmenitites.t),
      transaction: transaction,
    );
  }

  Future<RoomAmenitites> updateRow(
    _i1.Session session,
    RoomAmenitites row, {
    _i1.ColumnSelections<RoomAmenititesTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<RoomAmenitites>(
      row,
      columns: columns?.call(RoomAmenitites.t),
      transaction: transaction,
    );
  }

  Future<List<RoomAmenitites>> delete(
    _i1.Session session,
    List<RoomAmenitites> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<RoomAmenitites>(
      rows,
      transaction: transaction,
    );
  }

  Future<RoomAmenitites> deleteRow(
    _i1.Session session,
    RoomAmenitites row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<RoomAmenitites>(
      row,
      transaction: transaction,
    );
  }

  Future<List<RoomAmenitites>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<RoomAmenititesTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<RoomAmenitites>(
      where: where(RoomAmenitites.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RoomAmenititesTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<RoomAmenitites>(
      where: where?.call(RoomAmenitites.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class RoomAmenititesAttachRowRepository {
  const RoomAmenititesAttachRowRepository._();

  Future<void> room(
    _i1.Session session,
    RoomAmenitites roomAmenitites,
    _i2.Room room, {
    _i1.Transaction? transaction,
  }) async {
    if (roomAmenitites.id == null) {
      throw ArgumentError.notNull('roomAmenitites.id');
    }
    if (room.id == null) {
      throw ArgumentError.notNull('room.id');
    }

    var $roomAmenitites = roomAmenitites.copyWith(roomId: room.id);
    await session.db.updateRow<RoomAmenitites>(
      $roomAmenitites,
      columns: [RoomAmenitites.t.roomId],
      transaction: transaction,
    );
  }

  Future<void> amenity(
    _i1.Session session,
    RoomAmenitites roomAmenitites,
    _i3.Amenity amenity, {
    _i1.Transaction? transaction,
  }) async {
    if (roomAmenitites.id == null) {
      throw ArgumentError.notNull('roomAmenitites.id');
    }
    if (amenity.id == null) {
      throw ArgumentError.notNull('amenity.id');
    }

    var $roomAmenitites = roomAmenitites.copyWith(amenityId: amenity.id);
    await session.db.updateRow<RoomAmenitites>(
      $roomAmenitites,
      columns: [RoomAmenitites.t.amenityId],
      transaction: transaction,
    );
  }
}
