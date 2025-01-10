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
import '../enums/auth_error_type_enum.dart' as _i2;

abstract class AuthException
    implements _i1.SerializableException, _i1.SerializableModel {
  AuthException._({
    String? message,
    required this.errorType,
  }) : message = message ?? 'An error occurred';

  factory AuthException({
    String? message,
    required _i2.AuthErrorType errorType,
  }) = _AuthExceptionImpl;

  factory AuthException.fromJson(Map<String, dynamic> jsonSerialization) {
    return AuthException(
      message: jsonSerialization['message'] as String,
      errorType:
          _i2.AuthErrorType.fromJson((jsonSerialization['errorType'] as int)),
    );
  }

  String message;

  _i2.AuthErrorType errorType;

  AuthException copyWith({
    String? message,
    _i2.AuthErrorType? errorType,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'errorType': errorType.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _AuthExceptionImpl extends AuthException {
  _AuthExceptionImpl({
    String? message,
    required _i2.AuthErrorType errorType,
  }) : super._(
          message: message,
          errorType: errorType,
        );

  @override
  AuthException copyWith({
    String? message,
    _i2.AuthErrorType? errorType,
  }) {
    return AuthException(
      message: message ?? this.message,
      errorType: errorType ?? this.errorType,
    );
  }
}
