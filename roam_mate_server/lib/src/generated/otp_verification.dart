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

abstract class OtpVerification
    implements _i1.TableRow, _i1.ProtocolSerialization {
  OtpVerification._({
    this.id,
    required this.secret,
    required this.email,
  });

  factory OtpVerification({
    int? id,
    required String secret,
    required String email,
  }) = _OtpVerificationImpl;

  factory OtpVerification.fromJson(Map<String, dynamic> jsonSerialization) {
    return OtpVerification(
      id: jsonSerialization['id'] as int?,
      secret: jsonSerialization['secret'] as String,
      email: jsonSerialization['email'] as String,
    );
  }

  static final t = OtpVerificationTable();

  static const db = OtpVerificationRepository._();

  @override
  int? id;

  String secret;

  String email;

  @override
  _i1.Table get table => t;

  OtpVerification copyWith({
    int? id,
    String? secret,
    String? email,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'secret': secret,
      'email': email,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'secret': secret,
      'email': email,
    };
  }

  static OtpVerificationInclude include() {
    return OtpVerificationInclude._();
  }

  static OtpVerificationIncludeList includeList({
    _i1.WhereExpressionBuilder<OtpVerificationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<OtpVerificationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OtpVerificationTable>? orderByList,
    OtpVerificationInclude? include,
  }) {
    return OtpVerificationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(OtpVerification.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(OtpVerification.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _OtpVerificationImpl extends OtpVerification {
  _OtpVerificationImpl({
    int? id,
    required String secret,
    required String email,
  }) : super._(
          id: id,
          secret: secret,
          email: email,
        );

  @override
  OtpVerification copyWith({
    Object? id = _Undefined,
    String? secret,
    String? email,
  }) {
    return OtpVerification(
      id: id is int? ? id : this.id,
      secret: secret ?? this.secret,
      email: email ?? this.email,
    );
  }
}

class OtpVerificationTable extends _i1.Table {
  OtpVerificationTable({super.tableRelation})
      : super(tableName: 'otp_verifcation') {
    secret = _i1.ColumnString(
      'secret',
      this,
    );
    email = _i1.ColumnString(
      'email',
      this,
    );
  }

  late final _i1.ColumnString secret;

  late final _i1.ColumnString email;

  @override
  List<_i1.Column> get columns => [
        id,
        secret,
        email,
      ];
}

class OtpVerificationInclude extends _i1.IncludeObject {
  OtpVerificationInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => OtpVerification.t;
}

class OtpVerificationIncludeList extends _i1.IncludeList {
  OtpVerificationIncludeList._({
    _i1.WhereExpressionBuilder<OtpVerificationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(OtpVerification.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => OtpVerification.t;
}

class OtpVerificationRepository {
  const OtpVerificationRepository._();

  Future<List<OtpVerification>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OtpVerificationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<OtpVerificationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OtpVerificationTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<OtpVerification>(
      where: where?.call(OtpVerification.t),
      orderBy: orderBy?.call(OtpVerification.t),
      orderByList: orderByList?.call(OtpVerification.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<OtpVerification?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OtpVerificationTable>? where,
    int? offset,
    _i1.OrderByBuilder<OtpVerificationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OtpVerificationTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<OtpVerification>(
      where: where?.call(OtpVerification.t),
      orderBy: orderBy?.call(OtpVerification.t),
      orderByList: orderByList?.call(OtpVerification.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<OtpVerification?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<OtpVerification>(
      id,
      transaction: transaction,
    );
  }

  Future<List<OtpVerification>> insert(
    _i1.Session session,
    List<OtpVerification> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<OtpVerification>(
      rows,
      transaction: transaction,
    );
  }

  Future<OtpVerification> insertRow(
    _i1.Session session,
    OtpVerification row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<OtpVerification>(
      row,
      transaction: transaction,
    );
  }

  Future<List<OtpVerification>> update(
    _i1.Session session,
    List<OtpVerification> rows, {
    _i1.ColumnSelections<OtpVerificationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<OtpVerification>(
      rows,
      columns: columns?.call(OtpVerification.t),
      transaction: transaction,
    );
  }

  Future<OtpVerification> updateRow(
    _i1.Session session,
    OtpVerification row, {
    _i1.ColumnSelections<OtpVerificationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<OtpVerification>(
      row,
      columns: columns?.call(OtpVerification.t),
      transaction: transaction,
    );
  }

  Future<List<OtpVerification>> delete(
    _i1.Session session,
    List<OtpVerification> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<OtpVerification>(
      rows,
      transaction: transaction,
    );
  }

  Future<OtpVerification> deleteRow(
    _i1.Session session,
    OtpVerification row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<OtpVerification>(
      row,
      transaction: transaction,
    );
  }

  Future<List<OtpVerification>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<OtpVerificationTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<OtpVerification>(
      where: where(OtpVerification.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OtpVerificationTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<OtpVerification>(
      where: where?.call(OtpVerification.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
