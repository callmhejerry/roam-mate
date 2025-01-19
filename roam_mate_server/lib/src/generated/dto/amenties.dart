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

abstract class Amenity implements _i1.TableRow, _i1.ProtocolSerialization {
  Amenity._({
    this.id,
    required this.name,
  });

  factory Amenity({
    int? id,
    required String name,
  }) = _AmenityImpl;

  factory Amenity.fromJson(Map<String, dynamic> jsonSerialization) {
    return Amenity(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
    );
  }

  static final t = AmenityTable();

  static const db = AmenityRepository._();

  @override
  int? id;

  String name;

  @override
  _i1.Table get table => t;

  Amenity copyWith({
    int? id,
    String? name,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
    };
  }

  static AmenityInclude include() {
    return AmenityInclude._();
  }

  static AmenityIncludeList includeList({
    _i1.WhereExpressionBuilder<AmenityTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AmenityTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AmenityTable>? orderByList,
    AmenityInclude? include,
  }) {
    return AmenityIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Amenity.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Amenity.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AmenityImpl extends Amenity {
  _AmenityImpl({
    int? id,
    required String name,
  }) : super._(
          id: id,
          name: name,
        );

  @override
  Amenity copyWith({
    Object? id = _Undefined,
    String? name,
  }) {
    return Amenity(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
    );
  }
}

class AmenityTable extends _i1.Table {
  AmenityTable({super.tableRelation}) : super(tableName: 'amenities') {
    name = _i1.ColumnString(
      'name',
      this,
    );
  }

  late final _i1.ColumnString name;

  @override
  List<_i1.Column> get columns => [
        id,
        name,
      ];
}

class AmenityInclude extends _i1.IncludeObject {
  AmenityInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Amenity.t;
}

class AmenityIncludeList extends _i1.IncludeList {
  AmenityIncludeList._({
    _i1.WhereExpressionBuilder<AmenityTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Amenity.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Amenity.t;
}

class AmenityRepository {
  const AmenityRepository._();

  Future<List<Amenity>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AmenityTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AmenityTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AmenityTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Amenity>(
      where: where?.call(Amenity.t),
      orderBy: orderBy?.call(Amenity.t),
      orderByList: orderByList?.call(Amenity.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Amenity?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AmenityTable>? where,
    int? offset,
    _i1.OrderByBuilder<AmenityTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AmenityTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Amenity>(
      where: where?.call(Amenity.t),
      orderBy: orderBy?.call(Amenity.t),
      orderByList: orderByList?.call(Amenity.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Amenity?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Amenity>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Amenity>> insert(
    _i1.Session session,
    List<Amenity> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Amenity>(
      rows,
      transaction: transaction,
    );
  }

  Future<Amenity> insertRow(
    _i1.Session session,
    Amenity row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Amenity>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Amenity>> update(
    _i1.Session session,
    List<Amenity> rows, {
    _i1.ColumnSelections<AmenityTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Amenity>(
      rows,
      columns: columns?.call(Amenity.t),
      transaction: transaction,
    );
  }

  Future<Amenity> updateRow(
    _i1.Session session,
    Amenity row, {
    _i1.ColumnSelections<AmenityTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Amenity>(
      row,
      columns: columns?.call(Amenity.t),
      transaction: transaction,
    );
  }

  Future<List<Amenity>> delete(
    _i1.Session session,
    List<Amenity> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Amenity>(
      rows,
      transaction: transaction,
    );
  }

  Future<Amenity> deleteRow(
    _i1.Session session,
    Amenity row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Amenity>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Amenity>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<AmenityTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Amenity>(
      where: where(Amenity.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AmenityTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Amenity>(
      where: where?.call(Amenity.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
