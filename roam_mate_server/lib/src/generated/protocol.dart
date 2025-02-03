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
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i3;
import 'dto/amenties.dart' as _i4;
import 'dto/example.dart' as _i5;
import 'dto/otp_verification.dart' as _i6;
import 'dto/property.dart' as _i7;
import 'dto/property_amenities.dart' as _i8;
import 'dto/property_review.dart' as _i9;
import 'dto/room.dart' as _i10;
import 'dto/room_amenities.dart' as _i11;
import 'dto/user.dart' as _i12;
import 'dto/user_profile_model.dart' as _i13;
import 'enums/auth_error_type_enum.dart' as _i14;
import 'enums/gender_enum.dart' as _i15;
import 'enums/property_status_enum.dart' as _i16;
import 'enums/property_type_enum.dart' as _i17;
import 'enums/room_type_enum.dart' as _i18;
import 'exceptions/auth_exception.dart' as _i19;
import 'response/login_response.dart' as _i20;
export 'dto/amenties.dart';
export 'dto/example.dart';
export 'dto/otp_verification.dart';
export 'dto/property.dart';
export 'dto/property_amenities.dart';
export 'dto/property_review.dart';
export 'dto/room.dart';
export 'dto/room_amenities.dart';
export 'dto/user.dart';
export 'dto/user_profile_model.dart';
export 'enums/auth_error_type_enum.dart';
export 'enums/gender_enum.dart';
export 'enums/property_status_enum.dart';
export 'enums/property_type_enum.dart';
export 'enums/room_type_enum.dart';
export 'exceptions/auth_exception.dart';
export 'response/login_response.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'amenities',
      dartName: 'Amenity',
      schema: 'public',
      module: 'roam_mate',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'amenities_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'amenities_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'otp_verifcation',
      dartName: 'OtpVerification',
      schema: 'public',
      module: 'roam_mate',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'otp_verifcation_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'otp',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'expiredAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'email',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'otp_verifcation_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'unique_verification_email_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'email',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'property',
      dartName: 'Property',
      schema: 'public',
      module: 'roam_mate',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'property_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'location',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'price',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'roomType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:PropertyType',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'image',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'otherImages',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'video',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'numberOfRooms',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'verified',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'propertyOwnerName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'propertyOwnerEmail',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'propertyOwnerPhoneNumber',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'latitude',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'longitude',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'property_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'property_location_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'location',
            )
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'property_price_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'price',
            )
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'property_amenities',
      dartName: 'PropertyAmenitites',
      schema: 'public',
      module: 'roam_mate',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'property_amenities_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'propertyId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'amenityId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'property_amenities_fk_0',
          columns: ['propertyId'],
          referenceTable: 'property',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'property_amenities_fk_1',
          columns: ['amenityId'],
          referenceTable: 'amenities',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'property_amenities_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'property_review',
      dartName: 'PropertyReview',
      schema: 'public',
      module: 'roam_mate',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'property_review_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'propertyId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'studentIdId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'rating',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'comment',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'property_review_fk_0',
          columns: ['propertyId'],
          referenceTable: 'property',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'property_review_fk_1',
          columns: ['studentIdId'],
          referenceTable: 'user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'property_review_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'room',
      dartName: 'Room',
      schema: 'public',
      module: 'roam_mate',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'room_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'address',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'lat',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'long',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'roomType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:RoomType',
        ),
        _i2.ColumnDefinition(
          name: 'preferredGender',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:Gender',
        ),
        _i2.ColumnDefinition(
          name: 'numberOfRoomMate',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'roomRules',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<String>',
        ),
        _i2.ColumnDefinition(
          name: 'rent',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'photos',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<String>',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'room_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'room_amenities',
      dartName: 'RoomAmenitites',
      schema: 'public',
      module: 'roam_mate',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'room_amenities_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'roomId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'amenityId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'room_amenities_fk_0',
          columns: ['roomId'],
          referenceTable: 'room',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'room_amenities_fk_1',
          columns: ['amenityId'],
          referenceTable: 'amenities',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'room_amenities_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'user',
      dartName: 'User',
      schema: 'public',
      module: 'roam_mate',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'user_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'scope',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'username',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'password',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'email',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'verified',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'user_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'unique_email_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'email',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'unique_username_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'username',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'user_profile',
      dartName: 'UserProfile',
      schema: 'public',
      module: 'roam_mate',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'user_profile_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'firstName',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'lastName',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'gender',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'protocol:Gender?',
        ),
        _i2.ColumnDefinition(
          name: 'courseOfStudy',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'yearEntered',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'user_profile_fk_0',
          columns: ['userId'],
          referenceTable: 'user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'user_profile_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetTableDefinitions,
    ..._i2.Protocol.targetTableDefinitions,
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i4.Amenity) {
      return _i4.Amenity.fromJson(data) as T;
    }
    if (t == _i5.Example) {
      return _i5.Example.fromJson(data) as T;
    }
    if (t == _i6.OtpVerification) {
      return _i6.OtpVerification.fromJson(data) as T;
    }
    if (t == _i7.Property) {
      return _i7.Property.fromJson(data) as T;
    }
    if (t == _i8.PropertyAmenitites) {
      return _i8.PropertyAmenitites.fromJson(data) as T;
    }
    if (t == _i9.PropertyReview) {
      return _i9.PropertyReview.fromJson(data) as T;
    }
    if (t == _i10.Room) {
      return _i10.Room.fromJson(data) as T;
    }
    if (t == _i11.RoomAmenitites) {
      return _i11.RoomAmenitites.fromJson(data) as T;
    }
    if (t == _i12.User) {
      return _i12.User.fromJson(data) as T;
    }
    if (t == _i13.UserProfile) {
      return _i13.UserProfile.fromJson(data) as T;
    }
    if (t == _i14.AuthErrorType) {
      return _i14.AuthErrorType.fromJson(data) as T;
    }
    if (t == _i15.Gender) {
      return _i15.Gender.fromJson(data) as T;
    }
    if (t == _i16.PropertyStatus) {
      return _i16.PropertyStatus.fromJson(data) as T;
    }
    if (t == _i17.PropertyType) {
      return _i17.PropertyType.fromJson(data) as T;
    }
    if (t == _i18.RoomType) {
      return _i18.RoomType.fromJson(data) as T;
    }
    if (t == _i19.AuthException) {
      return _i19.AuthException.fromJson(data) as T;
    }
    if (t == _i20.LoginResponse) {
      return _i20.LoginResponse.fromJson(data) as T;
    }
    if (t == _i1.getType<_i4.Amenity?>()) {
      return (data != null ? _i4.Amenity.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Example?>()) {
      return (data != null ? _i5.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.OtpVerification?>()) {
      return (data != null ? _i6.OtpVerification.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Property?>()) {
      return (data != null ? _i7.Property.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.PropertyAmenitites?>()) {
      return (data != null ? _i8.PropertyAmenitites.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.PropertyReview?>()) {
      return (data != null ? _i9.PropertyReview.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.Room?>()) {
      return (data != null ? _i10.Room.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.RoomAmenitites?>()) {
      return (data != null ? _i11.RoomAmenitites.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.User?>()) {
      return (data != null ? _i12.User.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.UserProfile?>()) {
      return (data != null ? _i13.UserProfile.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.AuthErrorType?>()) {
      return (data != null ? _i14.AuthErrorType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.Gender?>()) {
      return (data != null ? _i15.Gender.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.PropertyStatus?>()) {
      return (data != null ? _i16.PropertyStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.PropertyType?>()) {
      return (data != null ? _i17.PropertyType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.RoomType?>()) {
      return (data != null ? _i18.RoomType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.AuthException?>()) {
      return (data != null ? _i19.AuthException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.LoginResponse?>()) {
      return (data != null ? _i20.LoginResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i8.PropertyAmenitites>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i8.PropertyAmenitites>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i11.RoomAmenitites>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i11.RoomAmenitites>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList()
          as dynamic;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i4.Amenity) {
      return 'Amenity';
    }
    if (data is _i5.Example) {
      return 'Example';
    }
    if (data is _i6.OtpVerification) {
      return 'OtpVerification';
    }
    if (data is _i7.Property) {
      return 'Property';
    }
    if (data is _i8.PropertyAmenitites) {
      return 'PropertyAmenitites';
    }
    if (data is _i9.PropertyReview) {
      return 'PropertyReview';
    }
    if (data is _i10.Room) {
      return 'Room';
    }
    if (data is _i11.RoomAmenitites) {
      return 'RoomAmenitites';
    }
    if (data is _i12.User) {
      return 'User';
    }
    if (data is _i13.UserProfile) {
      return 'UserProfile';
    }
    if (data is _i14.AuthErrorType) {
      return 'AuthErrorType';
    }
    if (data is _i15.Gender) {
      return 'Gender';
    }
    if (data is _i16.PropertyStatus) {
      return 'PropertyStatus';
    }
    if (data is _i17.PropertyType) {
      return 'PropertyType';
    }
    if (data is _i18.RoomType) {
      return 'RoomType';
    }
    if (data is _i19.AuthException) {
      return 'AuthException';
    }
    if (data is _i20.LoginResponse) {
      return 'LoginResponse';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Amenity') {
      return deserialize<_i4.Amenity>(data['data']);
    }
    if (dataClassName == 'Example') {
      return deserialize<_i5.Example>(data['data']);
    }
    if (dataClassName == 'OtpVerification') {
      return deserialize<_i6.OtpVerification>(data['data']);
    }
    if (dataClassName == 'Property') {
      return deserialize<_i7.Property>(data['data']);
    }
    if (dataClassName == 'PropertyAmenitites') {
      return deserialize<_i8.PropertyAmenitites>(data['data']);
    }
    if (dataClassName == 'PropertyReview') {
      return deserialize<_i9.PropertyReview>(data['data']);
    }
    if (dataClassName == 'Room') {
      return deserialize<_i10.Room>(data['data']);
    }
    if (dataClassName == 'RoomAmenitites') {
      return deserialize<_i11.RoomAmenitites>(data['data']);
    }
    if (dataClassName == 'User') {
      return deserialize<_i12.User>(data['data']);
    }
    if (dataClassName == 'UserProfile') {
      return deserialize<_i13.UserProfile>(data['data']);
    }
    if (dataClassName == 'AuthErrorType') {
      return deserialize<_i14.AuthErrorType>(data['data']);
    }
    if (dataClassName == 'Gender') {
      return deserialize<_i15.Gender>(data['data']);
    }
    if (dataClassName == 'PropertyStatus') {
      return deserialize<_i16.PropertyStatus>(data['data']);
    }
    if (dataClassName == 'PropertyType') {
      return deserialize<_i17.PropertyType>(data['data']);
    }
    if (dataClassName == 'RoomType') {
      return deserialize<_i18.RoomType>(data['data']);
    }
    if (dataClassName == 'AuthException') {
      return deserialize<_i19.AuthException>(data['data']);
    }
    if (dataClassName == 'LoginResponse') {
      return deserialize<_i20.LoginResponse>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i3.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i4.Amenity:
        return _i4.Amenity.t;
      case _i6.OtpVerification:
        return _i6.OtpVerification.t;
      case _i7.Property:
        return _i7.Property.t;
      case _i8.PropertyAmenitites:
        return _i8.PropertyAmenitites.t;
      case _i9.PropertyReview:
        return _i9.PropertyReview.t;
      case _i10.Room:
        return _i10.Room.t;
      case _i11.RoomAmenitites:
        return _i11.RoomAmenitites.t;
      case _i12.User:
        return _i12.User.t;
      case _i13.UserProfile:
        return _i13.UserProfile.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'roam_mate';
}
