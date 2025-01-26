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
import '../enums/property_type_enum.dart' as _i2;
import '../dto/property_amenities.dart' as _i3;

abstract class Property implements _i1.TableRow, _i1.ProtocolSerialization {
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
    this.amenities,
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
    List<_i3.PropertyAmenitites>? amenities,
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
      amenities: (jsonSerialization['amenities'] as List?)
          ?.map((e) =>
              _i3.PropertyAmenitites.fromJson((e as Map<String, dynamic>)))
          .toList(),
      latitude: (jsonSerialization['latitude'] as num).toDouble(),
      longitude: (jsonSerialization['longitude'] as num).toDouble(),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = PropertyTable();

  static const db = PropertyRepository._();

  @override
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

  List<_i3.PropertyAmenitites>? amenities;

  double latitude;

  double longitude;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table get table => t;

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
    List<_i3.PropertyAmenitites>? amenities,
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
      if (amenities != null)
        'amenities': amenities?.toJson(valueToJson: (v) => v.toJson()),
      'latitude': latitude,
      'longitude': longitude,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
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
      if (amenities != null)
        'amenities':
            amenities?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'latitude': latitude,
      'longitude': longitude,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static PropertyInclude include(
      {_i3.PropertyAmenititesIncludeList? amenities}) {
    return PropertyInclude._(amenities: amenities);
  }

  static PropertyIncludeList includeList({
    _i1.WhereExpressionBuilder<PropertyTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PropertyTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PropertyTable>? orderByList,
    PropertyInclude? include,
  }) {
    return PropertyIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Property.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Property.t),
      include: include,
    );
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
    List<_i3.PropertyAmenitites>? amenities,
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
          amenities: amenities,
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
    Object? amenities = _Undefined,
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
      amenities: amenities is List<_i3.PropertyAmenitites>?
          ? amenities
          : this.amenities?.map((e0) => e0.copyWith()).toList(),
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class PropertyTable extends _i1.Table {
  PropertyTable({super.tableRelation}) : super(tableName: 'property') {
    location = _i1.ColumnString(
      'location',
      this,
    );
    price = _i1.ColumnDouble(
      'price',
      this,
    );
    roomType = _i1.ColumnEnum(
      'roomType',
      this,
      _i1.EnumSerialization.byName,
    );
    title = _i1.ColumnString(
      'title',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    image = _i1.ColumnString(
      'image',
      this,
    );
    otherImages = _i1.ColumnString(
      'otherImages',
      this,
    );
    video = _i1.ColumnString(
      'video',
      this,
    );
    numberOfRooms = _i1.ColumnInt(
      'numberOfRooms',
      this,
    );
    verified = _i1.ColumnBool(
      'verified',
      this,
    );
    propertyOwnerName = _i1.ColumnString(
      'propertyOwnerName',
      this,
    );
    propertyOwnerEmail = _i1.ColumnString(
      'propertyOwnerEmail',
      this,
    );
    propertyOwnerPhoneNumber = _i1.ColumnString(
      'propertyOwnerPhoneNumber',
      this,
    );
    latitude = _i1.ColumnDouble(
      'latitude',
      this,
    );
    longitude = _i1.ColumnDouble(
      'longitude',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
    );
  }

  late final _i1.ColumnString location;

  late final _i1.ColumnDouble price;

  late final _i1.ColumnEnum<_i2.PropertyType> roomType;

  late final _i1.ColumnString title;

  late final _i1.ColumnString description;

  late final _i1.ColumnString image;

  late final _i1.ColumnString otherImages;

  late final _i1.ColumnString video;

  late final _i1.ColumnInt numberOfRooms;

  late final _i1.ColumnBool verified;

  late final _i1.ColumnString propertyOwnerName;

  late final _i1.ColumnString propertyOwnerEmail;

  late final _i1.ColumnString propertyOwnerPhoneNumber;

  _i3.PropertyAmenititesTable? ___amenities;

  _i1.ManyRelation<_i3.PropertyAmenititesTable>? _amenities;

  late final _i1.ColumnDouble latitude;

  late final _i1.ColumnDouble longitude;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i3.PropertyAmenititesTable get __amenities {
    if (___amenities != null) return ___amenities!;
    ___amenities = _i1.createRelationTable(
      relationFieldName: '__amenities',
      field: Property.t.id,
      foreignField: _i3.PropertyAmenitites.t.propertyId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.PropertyAmenititesTable(tableRelation: foreignTableRelation),
    );
    return ___amenities!;
  }

  _i1.ManyRelation<_i3.PropertyAmenititesTable> get amenities {
    if (_amenities != null) return _amenities!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'amenities',
      field: Property.t.id,
      foreignField: _i3.PropertyAmenitites.t.propertyId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.PropertyAmenititesTable(tableRelation: foreignTableRelation),
    );
    _amenities = _i1.ManyRelation<_i3.PropertyAmenititesTable>(
      tableWithRelations: relationTable,
      table: _i3.PropertyAmenititesTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _amenities!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        location,
        price,
        roomType,
        title,
        description,
        image,
        otherImages,
        video,
        numberOfRooms,
        verified,
        propertyOwnerName,
        propertyOwnerEmail,
        propertyOwnerPhoneNumber,
        latitude,
        longitude,
        createdAt,
        updatedAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'amenities') {
      return __amenities;
    }
    return null;
  }
}

class PropertyInclude extends _i1.IncludeObject {
  PropertyInclude._({_i3.PropertyAmenititesIncludeList? amenities}) {
    _amenities = amenities;
  }

  _i3.PropertyAmenititesIncludeList? _amenities;

  @override
  Map<String, _i1.Include?> get includes => {'amenities': _amenities};

  @override
  _i1.Table get table => Property.t;
}

class PropertyIncludeList extends _i1.IncludeList {
  PropertyIncludeList._({
    _i1.WhereExpressionBuilder<PropertyTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Property.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Property.t;
}

class PropertyRepository {
  const PropertyRepository._();

  final attach = const PropertyAttachRepository._();

  final attachRow = const PropertyAttachRowRepository._();

  final detach = const PropertyDetachRepository._();

  final detachRow = const PropertyDetachRowRepository._();

  Future<List<Property>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PropertyTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PropertyTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PropertyTable>? orderByList,
    _i1.Transaction? transaction,
    PropertyInclude? include,
  }) async {
    return session.db.find<Property>(
      where: where?.call(Property.t),
      orderBy: orderBy?.call(Property.t),
      orderByList: orderByList?.call(Property.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Property?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PropertyTable>? where,
    int? offset,
    _i1.OrderByBuilder<PropertyTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PropertyTable>? orderByList,
    _i1.Transaction? transaction,
    PropertyInclude? include,
  }) async {
    return session.db.findFirstRow<Property>(
      where: where?.call(Property.t),
      orderBy: orderBy?.call(Property.t),
      orderByList: orderByList?.call(Property.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Property?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PropertyInclude? include,
  }) async {
    return session.db.findById<Property>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<Property>> insert(
    _i1.Session session,
    List<Property> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Property>(
      rows,
      transaction: transaction,
    );
  }

  Future<Property> insertRow(
    _i1.Session session,
    Property row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Property>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Property>> update(
    _i1.Session session,
    List<Property> rows, {
    _i1.ColumnSelections<PropertyTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Property>(
      rows,
      columns: columns?.call(Property.t),
      transaction: transaction,
    );
  }

  Future<Property> updateRow(
    _i1.Session session,
    Property row, {
    _i1.ColumnSelections<PropertyTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Property>(
      row,
      columns: columns?.call(Property.t),
      transaction: transaction,
    );
  }

  Future<List<Property>> delete(
    _i1.Session session,
    List<Property> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Property>(
      rows,
      transaction: transaction,
    );
  }

  Future<Property> deleteRow(
    _i1.Session session,
    Property row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Property>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Property>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PropertyTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Property>(
      where: where(Property.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PropertyTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Property>(
      where: where?.call(Property.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PropertyAttachRepository {
  const PropertyAttachRepository._();

  Future<void> amenities(
    _i1.Session session,
    Property property,
    List<_i3.PropertyAmenitites> propertyAmenitites, {
    _i1.Transaction? transaction,
  }) async {
    if (propertyAmenitites.any((e) => e.id == null)) {
      throw ArgumentError.notNull('propertyAmenitites.id');
    }
    if (property.id == null) {
      throw ArgumentError.notNull('property.id');
    }

    var $propertyAmenitites = propertyAmenitites
        .map((e) => e.copyWith(propertyId: property.id))
        .toList();
    await session.db.update<_i3.PropertyAmenitites>(
      $propertyAmenitites,
      columns: [_i3.PropertyAmenitites.t.propertyId],
      transaction: transaction,
    );
  }
}

class PropertyAttachRowRepository {
  const PropertyAttachRowRepository._();

  Future<void> amenities(
    _i1.Session session,
    Property property,
    _i3.PropertyAmenitites propertyAmenitites, {
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
    await session.db.updateRow<_i3.PropertyAmenitites>(
      $propertyAmenitites,
      columns: [_i3.PropertyAmenitites.t.propertyId],
      transaction: transaction,
    );
  }
}

class PropertyDetachRepository {
  const PropertyDetachRepository._();

  Future<void> amenities(
    _i1.Session session,
    List<_i3.PropertyAmenitites> propertyAmenitites, {
    _i1.Transaction? transaction,
  }) async {
    if (propertyAmenitites.any((e) => e.id == null)) {
      throw ArgumentError.notNull('propertyAmenitites.id');
    }

    var $propertyAmenitites =
        propertyAmenitites.map((e) => e.copyWith(propertyId: null)).toList();
    await session.db.update<_i3.PropertyAmenitites>(
      $propertyAmenitites,
      columns: [_i3.PropertyAmenitites.t.propertyId],
      transaction: transaction,
    );
  }
}

class PropertyDetachRowRepository {
  const PropertyDetachRowRepository._();

  Future<void> amenities(
    _i1.Session session,
    _i3.PropertyAmenitites propertyAmenitites, {
    _i1.Transaction? transaction,
  }) async {
    if (propertyAmenitites.id == null) {
      throw ArgumentError.notNull('propertyAmenitites.id');
    }

    var $propertyAmenitites = propertyAmenitites.copyWith(propertyId: null);
    await session.db.updateRow<_i3.PropertyAmenitites>(
      $propertyAmenitites,
      columns: [_i3.PropertyAmenitites.t.propertyId],
      transaction: transaction,
    );
  }
}
