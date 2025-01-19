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
import '../dto/user.dart' as _i2;
import '../enums/gender_enum.dart' as _i3;

abstract class UserProfile implements _i1.TableRow, _i1.ProtocolSerialization {
  UserProfile._({
    this.id,
    required this.userId,
    this.user,
    this.firstName,
    this.lastName,
    this.gender,
    this.courseOfStudy,
    this.yearEntered,
  });

  factory UserProfile({
    int? id,
    required int userId,
    _i2.User? user,
    String? firstName,
    String? lastName,
    _i3.Gender? gender,
    String? courseOfStudy,
    int? yearEntered,
  }) = _UserProfileImpl;

  factory UserProfile.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserProfile(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      user: jsonSerialization['user'] == null
          ? null
          : _i2.User.fromJson(
              (jsonSerialization['user'] as Map<String, dynamic>)),
      firstName: jsonSerialization['firstName'] as String?,
      lastName: jsonSerialization['lastName'] as String?,
      gender: jsonSerialization['gender'] == null
          ? null
          : _i3.Gender.fromJson((jsonSerialization['gender'] as String)),
      courseOfStudy: jsonSerialization['courseOfStudy'] as String?,
      yearEntered: jsonSerialization['yearEntered'] as int?,
    );
  }

  static final t = UserProfileTable();

  static const db = UserProfileRepository._();

  @override
  int? id;

  int userId;

  _i2.User? user;

  String? firstName;

  String? lastName;

  _i3.Gender? gender;

  String? courseOfStudy;

  int? yearEntered;

  @override
  _i1.Table get table => t;

  UserProfile copyWith({
    int? id,
    int? userId,
    _i2.User? user,
    String? firstName,
    String? lastName,
    _i3.Gender? gender,
    String? courseOfStudy,
    int? yearEntered,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJson(),
      if (firstName != null) 'firstName': firstName,
      if (lastName != null) 'lastName': lastName,
      if (gender != null) 'gender': gender?.toJson(),
      if (courseOfStudy != null) 'courseOfStudy': courseOfStudy,
      if (yearEntered != null) 'yearEntered': yearEntered,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJsonForProtocol(),
      if (firstName != null) 'firstName': firstName,
      if (lastName != null) 'lastName': lastName,
      if (gender != null) 'gender': gender?.toJson(),
      if (courseOfStudy != null) 'courseOfStudy': courseOfStudy,
      if (yearEntered != null) 'yearEntered': yearEntered,
    };
  }

  static UserProfileInclude include({_i2.UserInclude? user}) {
    return UserProfileInclude._(user: user);
  }

  static UserProfileIncludeList includeList({
    _i1.WhereExpressionBuilder<UserProfileTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserProfileTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserProfileTable>? orderByList,
    UserProfileInclude? include,
  }) {
    return UserProfileIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UserProfile.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(UserProfile.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserProfileImpl extends UserProfile {
  _UserProfileImpl({
    int? id,
    required int userId,
    _i2.User? user,
    String? firstName,
    String? lastName,
    _i3.Gender? gender,
    String? courseOfStudy,
    int? yearEntered,
  }) : super._(
          id: id,
          userId: userId,
          user: user,
          firstName: firstName,
          lastName: lastName,
          gender: gender,
          courseOfStudy: courseOfStudy,
          yearEntered: yearEntered,
        );

  @override
  UserProfile copyWith({
    Object? id = _Undefined,
    int? userId,
    Object? user = _Undefined,
    Object? firstName = _Undefined,
    Object? lastName = _Undefined,
    Object? gender = _Undefined,
    Object? courseOfStudy = _Undefined,
    Object? yearEntered = _Undefined,
  }) {
    return UserProfile(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2.User? ? user : this.user?.copyWith(),
      firstName: firstName is String? ? firstName : this.firstName,
      lastName: lastName is String? ? lastName : this.lastName,
      gender: gender is _i3.Gender? ? gender : this.gender,
      courseOfStudy:
          courseOfStudy is String? ? courseOfStudy : this.courseOfStudy,
      yearEntered: yearEntered is int? ? yearEntered : this.yearEntered,
    );
  }
}

class UserProfileTable extends _i1.Table {
  UserProfileTable({super.tableRelation}) : super(tableName: 'user_profile') {
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    firstName = _i1.ColumnString(
      'firstName',
      this,
    );
    lastName = _i1.ColumnString(
      'lastName',
      this,
    );
    gender = _i1.ColumnEnum(
      'gender',
      this,
      _i1.EnumSerialization.byName,
    );
    courseOfStudy = _i1.ColumnString(
      'courseOfStudy',
      this,
    );
    yearEntered = _i1.ColumnInt(
      'yearEntered',
      this,
    );
  }

  late final _i1.ColumnInt userId;

  _i2.UserTable? _user;

  late final _i1.ColumnString firstName;

  late final _i1.ColumnString lastName;

  late final _i1.ColumnEnum<_i3.Gender> gender;

  late final _i1.ColumnString courseOfStudy;

  late final _i1.ColumnInt yearEntered;

  _i2.UserTable get user {
    if (_user != null) return _user!;
    _user = _i1.createRelationTable(
      relationFieldName: 'user',
      field: UserProfile.t.userId,
      foreignField: _i2.User.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserTable(tableRelation: foreignTableRelation),
    );
    return _user!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        firstName,
        lastName,
        gender,
        courseOfStudy,
        yearEntered,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    return null;
  }
}

class UserProfileInclude extends _i1.IncludeObject {
  UserProfileInclude._({_i2.UserInclude? user}) {
    _user = user;
  }

  _i2.UserInclude? _user;

  @override
  Map<String, _i1.Include?> get includes => {'user': _user};

  @override
  _i1.Table get table => UserProfile.t;
}

class UserProfileIncludeList extends _i1.IncludeList {
  UserProfileIncludeList._({
    _i1.WhereExpressionBuilder<UserProfileTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(UserProfile.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => UserProfile.t;
}

class UserProfileRepository {
  const UserProfileRepository._();

  final attachRow = const UserProfileAttachRowRepository._();

  Future<List<UserProfile>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserProfileTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserProfileTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserProfileTable>? orderByList,
    _i1.Transaction? transaction,
    UserProfileInclude? include,
  }) async {
    return session.db.find<UserProfile>(
      where: where?.call(UserProfile.t),
      orderBy: orderBy?.call(UserProfile.t),
      orderByList: orderByList?.call(UserProfile.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<UserProfile?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserProfileTable>? where,
    int? offset,
    _i1.OrderByBuilder<UserProfileTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserProfileTable>? orderByList,
    _i1.Transaction? transaction,
    UserProfileInclude? include,
  }) async {
    return session.db.findFirstRow<UserProfile>(
      where: where?.call(UserProfile.t),
      orderBy: orderBy?.call(UserProfile.t),
      orderByList: orderByList?.call(UserProfile.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<UserProfile?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    UserProfileInclude? include,
  }) async {
    return session.db.findById<UserProfile>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<UserProfile>> insert(
    _i1.Session session,
    List<UserProfile> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<UserProfile>(
      rows,
      transaction: transaction,
    );
  }

  Future<UserProfile> insertRow(
    _i1.Session session,
    UserProfile row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<UserProfile>(
      row,
      transaction: transaction,
    );
  }

  Future<List<UserProfile>> update(
    _i1.Session session,
    List<UserProfile> rows, {
    _i1.ColumnSelections<UserProfileTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<UserProfile>(
      rows,
      columns: columns?.call(UserProfile.t),
      transaction: transaction,
    );
  }

  Future<UserProfile> updateRow(
    _i1.Session session,
    UserProfile row, {
    _i1.ColumnSelections<UserProfileTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<UserProfile>(
      row,
      columns: columns?.call(UserProfile.t),
      transaction: transaction,
    );
  }

  Future<List<UserProfile>> delete(
    _i1.Session session,
    List<UserProfile> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<UserProfile>(
      rows,
      transaction: transaction,
    );
  }

  Future<UserProfile> deleteRow(
    _i1.Session session,
    UserProfile row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<UserProfile>(
      row,
      transaction: transaction,
    );
  }

  Future<List<UserProfile>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UserProfileTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<UserProfile>(
      where: where(UserProfile.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserProfileTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<UserProfile>(
      where: where?.call(UserProfile.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class UserProfileAttachRowRepository {
  const UserProfileAttachRowRepository._();

  Future<void> user(
    _i1.Session session,
    UserProfile userProfile,
    _i2.User user, {
    _i1.Transaction? transaction,
  }) async {
    if (userProfile.id == null) {
      throw ArgumentError.notNull('userProfile.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $userProfile = userProfile.copyWith(userId: user.id);
    await session.db.updateRow<UserProfile>(
      $userProfile,
      columns: [UserProfile.t.userId],
      transaction: transaction,
    );
  }
}
