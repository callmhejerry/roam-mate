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
import '../dto/property.dart' as _i2;
import '../dto/user.dart' as _i3;

abstract class PropertyReview
    implements _i1.TableRow, _i1.ProtocolSerialization {
  PropertyReview._({
    this.id,
    required this.propertyId,
    this.property,
    required this.studentIdId,
    this.studentId,
    required this.rating,
    required this.comment,
    required this.createdAt,
  });

  factory PropertyReview({
    int? id,
    required int propertyId,
    _i2.Property? property,
    required int studentIdId,
    _i3.User? studentId,
    required double rating,
    required String comment,
    required DateTime createdAt,
  }) = _PropertyReviewImpl;

  factory PropertyReview.fromJson(Map<String, dynamic> jsonSerialization) {
    return PropertyReview(
      id: jsonSerialization['id'] as int?,
      propertyId: jsonSerialization['propertyId'] as int,
      property: jsonSerialization['property'] == null
          ? null
          : _i2.Property.fromJson(
              (jsonSerialization['property'] as Map<String, dynamic>)),
      studentIdId: jsonSerialization['studentIdId'] as int,
      studentId: jsonSerialization['studentId'] == null
          ? null
          : _i3.User.fromJson(
              (jsonSerialization['studentId'] as Map<String, dynamic>)),
      rating: (jsonSerialization['rating'] as num).toDouble(),
      comment: jsonSerialization['comment'] as String,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = PropertyReviewTable();

  static const db = PropertyReviewRepository._();

  @override
  int? id;

  int propertyId;

  _i2.Property? property;

  int studentIdId;

  _i3.User? studentId;

  double rating;

  String comment;

  DateTime createdAt;

  @override
  _i1.Table get table => t;

  PropertyReview copyWith({
    int? id,
    int? propertyId,
    _i2.Property? property,
    int? studentIdId,
    _i3.User? studentId,
    double? rating,
    String? comment,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'propertyId': propertyId,
      if (property != null) 'property': property?.toJson(),
      'studentIdId': studentIdId,
      if (studentId != null) 'studentId': studentId?.toJson(),
      'rating': rating,
      'comment': comment,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'propertyId': propertyId,
      if (property != null) 'property': property?.toJsonForProtocol(),
      'studentIdId': studentIdId,
      if (studentId != null) 'studentId': studentId?.toJsonForProtocol(),
      'rating': rating,
      'comment': comment,
      'createdAt': createdAt.toJson(),
    };
  }

  static PropertyReviewInclude include({
    _i2.PropertyInclude? property,
    _i3.UserInclude? studentId,
  }) {
    return PropertyReviewInclude._(
      property: property,
      studentId: studentId,
    );
  }

  static PropertyReviewIncludeList includeList({
    _i1.WhereExpressionBuilder<PropertyReviewTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PropertyReviewTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PropertyReviewTable>? orderByList,
    PropertyReviewInclude? include,
  }) {
    return PropertyReviewIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PropertyReview.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PropertyReview.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PropertyReviewImpl extends PropertyReview {
  _PropertyReviewImpl({
    int? id,
    required int propertyId,
    _i2.Property? property,
    required int studentIdId,
    _i3.User? studentId,
    required double rating,
    required String comment,
    required DateTime createdAt,
  }) : super._(
          id: id,
          propertyId: propertyId,
          property: property,
          studentIdId: studentIdId,
          studentId: studentId,
          rating: rating,
          comment: comment,
          createdAt: createdAt,
        );

  @override
  PropertyReview copyWith({
    Object? id = _Undefined,
    int? propertyId,
    Object? property = _Undefined,
    int? studentIdId,
    Object? studentId = _Undefined,
    double? rating,
    String? comment,
    DateTime? createdAt,
  }) {
    return PropertyReview(
      id: id is int? ? id : this.id,
      propertyId: propertyId ?? this.propertyId,
      property:
          property is _i2.Property? ? property : this.property?.copyWith(),
      studentIdId: studentIdId ?? this.studentIdId,
      studentId:
          studentId is _i3.User? ? studentId : this.studentId?.copyWith(),
      rating: rating ?? this.rating,
      comment: comment ?? this.comment,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class PropertyReviewTable extends _i1.Table {
  PropertyReviewTable({super.tableRelation})
      : super(tableName: 'property_review') {
    propertyId = _i1.ColumnInt(
      'propertyId',
      this,
    );
    studentIdId = _i1.ColumnInt(
      'studentIdId',
      this,
    );
    rating = _i1.ColumnDouble(
      'rating',
      this,
    );
    comment = _i1.ColumnString(
      'comment',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final _i1.ColumnInt propertyId;

  _i2.PropertyTable? _property;

  late final _i1.ColumnInt studentIdId;

  _i3.UserTable? _studentId;

  late final _i1.ColumnDouble rating;

  late final _i1.ColumnString comment;

  late final _i1.ColumnDateTime createdAt;

  _i2.PropertyTable get property {
    if (_property != null) return _property!;
    _property = _i1.createRelationTable(
      relationFieldName: 'property',
      field: PropertyReview.t.propertyId,
      foreignField: _i2.Property.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.PropertyTable(tableRelation: foreignTableRelation),
    );
    return _property!;
  }

  _i3.UserTable get studentId {
    if (_studentId != null) return _studentId!;
    _studentId = _i1.createRelationTable(
      relationFieldName: 'studentId',
      field: PropertyReview.t.studentIdId,
      foreignField: _i3.User.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.UserTable(tableRelation: foreignTableRelation),
    );
    return _studentId!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        propertyId,
        studentIdId,
        rating,
        comment,
        createdAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'property') {
      return property;
    }
    if (relationField == 'studentId') {
      return studentId;
    }
    return null;
  }
}

class PropertyReviewInclude extends _i1.IncludeObject {
  PropertyReviewInclude._({
    _i2.PropertyInclude? property,
    _i3.UserInclude? studentId,
  }) {
    _property = property;
    _studentId = studentId;
  }

  _i2.PropertyInclude? _property;

  _i3.UserInclude? _studentId;

  @override
  Map<String, _i1.Include?> get includes => {
        'property': _property,
        'studentId': _studentId,
      };

  @override
  _i1.Table get table => PropertyReview.t;
}

class PropertyReviewIncludeList extends _i1.IncludeList {
  PropertyReviewIncludeList._({
    _i1.WhereExpressionBuilder<PropertyReviewTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PropertyReview.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => PropertyReview.t;
}

class PropertyReviewRepository {
  const PropertyReviewRepository._();

  final attachRow = const PropertyReviewAttachRowRepository._();

  Future<List<PropertyReview>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PropertyReviewTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PropertyReviewTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PropertyReviewTable>? orderByList,
    _i1.Transaction? transaction,
    PropertyReviewInclude? include,
  }) async {
    return session.db.find<PropertyReview>(
      where: where?.call(PropertyReview.t),
      orderBy: orderBy?.call(PropertyReview.t),
      orderByList: orderByList?.call(PropertyReview.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<PropertyReview?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PropertyReviewTable>? where,
    int? offset,
    _i1.OrderByBuilder<PropertyReviewTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PropertyReviewTable>? orderByList,
    _i1.Transaction? transaction,
    PropertyReviewInclude? include,
  }) async {
    return session.db.findFirstRow<PropertyReview>(
      where: where?.call(PropertyReview.t),
      orderBy: orderBy?.call(PropertyReview.t),
      orderByList: orderByList?.call(PropertyReview.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<PropertyReview?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PropertyReviewInclude? include,
  }) async {
    return session.db.findById<PropertyReview>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<PropertyReview>> insert(
    _i1.Session session,
    List<PropertyReview> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<PropertyReview>(
      rows,
      transaction: transaction,
    );
  }

  Future<PropertyReview> insertRow(
    _i1.Session session,
    PropertyReview row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PropertyReview>(
      row,
      transaction: transaction,
    );
  }

  Future<List<PropertyReview>> update(
    _i1.Session session,
    List<PropertyReview> rows, {
    _i1.ColumnSelections<PropertyReviewTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PropertyReview>(
      rows,
      columns: columns?.call(PropertyReview.t),
      transaction: transaction,
    );
  }

  Future<PropertyReview> updateRow(
    _i1.Session session,
    PropertyReview row, {
    _i1.ColumnSelections<PropertyReviewTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PropertyReview>(
      row,
      columns: columns?.call(PropertyReview.t),
      transaction: transaction,
    );
  }

  Future<List<PropertyReview>> delete(
    _i1.Session session,
    List<PropertyReview> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PropertyReview>(
      rows,
      transaction: transaction,
    );
  }

  Future<PropertyReview> deleteRow(
    _i1.Session session,
    PropertyReview row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PropertyReview>(
      row,
      transaction: transaction,
    );
  }

  Future<List<PropertyReview>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PropertyReviewTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PropertyReview>(
      where: where(PropertyReview.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PropertyReviewTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PropertyReview>(
      where: where?.call(PropertyReview.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PropertyReviewAttachRowRepository {
  const PropertyReviewAttachRowRepository._();

  Future<void> property(
    _i1.Session session,
    PropertyReview propertyReview,
    _i2.Property property, {
    _i1.Transaction? transaction,
  }) async {
    if (propertyReview.id == null) {
      throw ArgumentError.notNull('propertyReview.id');
    }
    if (property.id == null) {
      throw ArgumentError.notNull('property.id');
    }

    var $propertyReview = propertyReview.copyWith(propertyId: property.id);
    await session.db.updateRow<PropertyReview>(
      $propertyReview,
      columns: [PropertyReview.t.propertyId],
      transaction: transaction,
    );
  }

  Future<void> studentId(
    _i1.Session session,
    PropertyReview propertyReview,
    _i3.User studentId, {
    _i1.Transaction? transaction,
  }) async {
    if (propertyReview.id == null) {
      throw ArgumentError.notNull('propertyReview.id');
    }
    if (studentId.id == null) {
      throw ArgumentError.notNull('studentId.id');
    }

    var $propertyReview = propertyReview.copyWith(studentIdId: studentId.id);
    await session.db.updateRow<PropertyReview>(
      $propertyReview,
      columns: [PropertyReview.t.studentIdId],
      transaction: transaction,
    );
  }
}
