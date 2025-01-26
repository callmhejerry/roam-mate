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
import '../dto/amenties.dart' as _i3;

abstract class PropertyAmenitites
    implements _i1.TableRow, _i1.ProtocolSerialization {
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

  static final t = PropertyAmenititesTable();

  static const db = PropertyAmenititesRepository._();

  @override
  int? id;

  int propertyId;

  _i2.Property? property;

  int amenityId;

  _i3.Amenity? amenity;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'propertyId': propertyId,
      if (property != null) 'property': property?.toJsonForProtocol(),
      'amenityId': amenityId,
      if (amenity != null) 'amenity': amenity?.toJsonForProtocol(),
    };
  }

  static PropertyAmenititesInclude include({
    _i2.PropertyInclude? property,
    _i3.AmenityInclude? amenity,
  }) {
    return PropertyAmenititesInclude._(
      property: property,
      amenity: amenity,
    );
  }

  static PropertyAmenititesIncludeList includeList({
    _i1.WhereExpressionBuilder<PropertyAmenititesTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PropertyAmenititesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PropertyAmenititesTable>? orderByList,
    PropertyAmenititesInclude? include,
  }) {
    return PropertyAmenititesIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PropertyAmenitites.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PropertyAmenitites.t),
      include: include,
    );
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

class PropertyAmenititesTable extends _i1.Table {
  PropertyAmenititesTable({super.tableRelation})
      : super(tableName: 'property_amenities') {
    propertyId = _i1.ColumnInt(
      'propertyId',
      this,
    );
    amenityId = _i1.ColumnInt(
      'amenityId',
      this,
    );
  }

  late final _i1.ColumnInt propertyId;

  _i2.PropertyTable? _property;

  late final _i1.ColumnInt amenityId;

  _i3.AmenityTable? _amenity;

  _i2.PropertyTable get property {
    if (_property != null) return _property!;
    _property = _i1.createRelationTable(
      relationFieldName: 'property',
      field: PropertyAmenitites.t.propertyId,
      foreignField: _i2.Property.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.PropertyTable(tableRelation: foreignTableRelation),
    );
    return _property!;
  }

  _i3.AmenityTable get amenity {
    if (_amenity != null) return _amenity!;
    _amenity = _i1.createRelationTable(
      relationFieldName: 'amenity',
      field: PropertyAmenitites.t.amenityId,
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
        propertyId,
        amenityId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'property') {
      return property;
    }
    if (relationField == 'amenity') {
      return amenity;
    }
    return null;
  }
}

class PropertyAmenititesInclude extends _i1.IncludeObject {
  PropertyAmenititesInclude._({
    _i2.PropertyInclude? property,
    _i3.AmenityInclude? amenity,
  }) {
    _property = property;
    _amenity = amenity;
  }

  _i2.PropertyInclude? _property;

  _i3.AmenityInclude? _amenity;

  @override
  Map<String, _i1.Include?> get includes => {
        'property': _property,
        'amenity': _amenity,
      };

  @override
  _i1.Table get table => PropertyAmenitites.t;
}

class PropertyAmenititesIncludeList extends _i1.IncludeList {
  PropertyAmenititesIncludeList._({
    _i1.WhereExpressionBuilder<PropertyAmenititesTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PropertyAmenitites.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => PropertyAmenitites.t;
}

class PropertyAmenititesRepository {
  const PropertyAmenititesRepository._();

  final attachRow = const PropertyAmenititesAttachRowRepository._();

  Future<List<PropertyAmenitites>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PropertyAmenititesTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PropertyAmenititesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PropertyAmenititesTable>? orderByList,
    _i1.Transaction? transaction,
    PropertyAmenititesInclude? include,
  }) async {
    return session.db.find<PropertyAmenitites>(
      where: where?.call(PropertyAmenitites.t),
      orderBy: orderBy?.call(PropertyAmenitites.t),
      orderByList: orderByList?.call(PropertyAmenitites.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<PropertyAmenitites?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PropertyAmenititesTable>? where,
    int? offset,
    _i1.OrderByBuilder<PropertyAmenititesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PropertyAmenititesTable>? orderByList,
    _i1.Transaction? transaction,
    PropertyAmenititesInclude? include,
  }) async {
    return session.db.findFirstRow<PropertyAmenitites>(
      where: where?.call(PropertyAmenitites.t),
      orderBy: orderBy?.call(PropertyAmenitites.t),
      orderByList: orderByList?.call(PropertyAmenitites.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<PropertyAmenitites?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PropertyAmenititesInclude? include,
  }) async {
    return session.db.findById<PropertyAmenitites>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<PropertyAmenitites>> insert(
    _i1.Session session,
    List<PropertyAmenitites> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<PropertyAmenitites>(
      rows,
      transaction: transaction,
    );
  }

  Future<PropertyAmenitites> insertRow(
    _i1.Session session,
    PropertyAmenitites row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PropertyAmenitites>(
      row,
      transaction: transaction,
    );
  }

  Future<List<PropertyAmenitites>> update(
    _i1.Session session,
    List<PropertyAmenitites> rows, {
    _i1.ColumnSelections<PropertyAmenititesTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PropertyAmenitites>(
      rows,
      columns: columns?.call(PropertyAmenitites.t),
      transaction: transaction,
    );
  }

  Future<PropertyAmenitites> updateRow(
    _i1.Session session,
    PropertyAmenitites row, {
    _i1.ColumnSelections<PropertyAmenititesTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PropertyAmenitites>(
      row,
      columns: columns?.call(PropertyAmenitites.t),
      transaction: transaction,
    );
  }

  Future<List<PropertyAmenitites>> delete(
    _i1.Session session,
    List<PropertyAmenitites> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PropertyAmenitites>(
      rows,
      transaction: transaction,
    );
  }

  Future<PropertyAmenitites> deleteRow(
    _i1.Session session,
    PropertyAmenitites row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PropertyAmenitites>(
      row,
      transaction: transaction,
    );
  }

  Future<List<PropertyAmenitites>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PropertyAmenititesTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PropertyAmenitites>(
      where: where(PropertyAmenitites.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PropertyAmenititesTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PropertyAmenitites>(
      where: where?.call(PropertyAmenitites.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PropertyAmenititesAttachRowRepository {
  const PropertyAmenititesAttachRowRepository._();

  Future<void> property(
    _i1.Session session,
    PropertyAmenitites propertyAmenitites,
    _i2.Property property, {
    _i1.Transaction? transaction,
  }) async {
    if (propertyAmenitites.id == null) {
      throw ArgumentError.notNull('propertyAmenitites.id');
    }
    if (property.id == null) {
      throw ArgumentError.notNull('property.id');
    }

    var $propertyAmenitites =
        propertyAmenitites.copyWith(propertyId: property.id);
    await session.db.updateRow<PropertyAmenitites>(
      $propertyAmenitites,
      columns: [PropertyAmenitites.t.propertyId],
      transaction: transaction,
    );
  }

  Future<void> amenity(
    _i1.Session session,
    PropertyAmenitites propertyAmenitites,
    _i3.Amenity amenity, {
    _i1.Transaction? transaction,
  }) async {
    if (propertyAmenitites.id == null) {
      throw ArgumentError.notNull('propertyAmenitites.id');
    }
    if (amenity.id == null) {
      throw ArgumentError.notNull('amenity.id');
    }

    var $propertyAmenitites =
        propertyAmenitites.copyWith(amenityId: amenity.id);
    await session.db.updateRow<PropertyAmenitites>(
      $propertyAmenitites,
      columns: [PropertyAmenitites.t.amenityId],
      transaction: transaction,
    );
  }
}
