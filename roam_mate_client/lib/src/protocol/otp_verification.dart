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

abstract class OtpVerification implements _i1.SerializableModel {
  OtpVerification._({
    this.id,
    required this.otp,
    required this.expiredAt,
    required this.email,
  });

  factory OtpVerification({
    int? id,
    required String otp,
    required DateTime expiredAt,
    required String email,
  }) = _OtpVerificationImpl;

  factory OtpVerification.fromJson(Map<String, dynamic> jsonSerialization) {
    return OtpVerification(
      id: jsonSerialization['id'] as int?,
      otp: jsonSerialization['otp'] as String,
      expiredAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['expiredAt']),
      email: jsonSerialization['email'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String otp;

  DateTime expiredAt;

  String email;

  OtpVerification copyWith({
    int? id,
    String? otp,
    DateTime? expiredAt,
    String? email,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'otp': otp,
      'expiredAt': expiredAt.toJson(),
      'email': email,
    };
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
    required String otp,
    required DateTime expiredAt,
    required String email,
  }) : super._(
          id: id,
          otp: otp,
          expiredAt: expiredAt,
          email: email,
        );

  @override
  OtpVerification copyWith({
    Object? id = _Undefined,
    String? otp,
    DateTime? expiredAt,
    String? email,
  }) {
    return OtpVerification(
      id: id is int? ? id : this.id,
      otp: otp ?? this.otp,
      expiredAt: expiredAt ?? this.expiredAt,
      email: email ?? this.email,
    );
  }
}
