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
import '../user.dart' as _i2;

abstract class LoginResponse
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  LoginResponse._({
    required this.authToken,
    required this.user,
  });

  factory LoginResponse({
    required String authToken,
    required _i2.User user,
  }) = _LoginResponseImpl;

  factory LoginResponse.fromJson(Map<String, dynamic> jsonSerialization) {
    return LoginResponse(
      authToken: jsonSerialization['authToken'] as String,
      user: _i2.User.fromJson(
          (jsonSerialization['user'] as Map<String, dynamic>)),
    );
  }

  String authToken;

  _i2.User user;

  LoginResponse copyWith({
    String? authToken,
    _i2.User? user,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'authToken': authToken,
      'user': user.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'authToken': authToken,
      'user': user.toJsonForProtocol(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _LoginResponseImpl extends LoginResponse {
  _LoginResponseImpl({
    required String authToken,
    required _i2.User user,
  }) : super._(
          authToken: authToken,
          user: user,
        );

  @override
  LoginResponse copyWith({
    String? authToken,
    _i2.User? user,
  }) {
    return LoginResponse(
      authToken: authToken ?? this.authToken,
      user: user ?? this.user.copyWith(),
    );
  }
}
