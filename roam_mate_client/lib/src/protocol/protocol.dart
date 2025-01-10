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
import 'enums/auth_error_type_enum.dart' as _i2;
import 'enums/gender_enum.dart' as _i3;
import 'example.dart' as _i4;
import 'exceptions/auth_exception.dart' as _i5;
import 'otp_verification.dart' as _i6;
import 'response/login_response.dart' as _i7;
import 'user.dart' as _i8;
import 'user_profile_model.dart' as _i9;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i10;
export 'enums/auth_error_type_enum.dart';
export 'enums/gender_enum.dart';
export 'example.dart';
export 'exceptions/auth_exception.dart';
export 'otp_verification.dart';
export 'response/login_response.dart';
export 'user.dart';
export 'user_profile_model.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.AuthErrorType) {
      return _i2.AuthErrorType.fromJson(data) as T;
    }
    if (t == _i3.Gender) {
      return _i3.Gender.fromJson(data) as T;
    }
    if (t == _i4.Example) {
      return _i4.Example.fromJson(data) as T;
    }
    if (t == _i5.AuthException) {
      return _i5.AuthException.fromJson(data) as T;
    }
    if (t == _i6.OtpVerification) {
      return _i6.OtpVerification.fromJson(data) as T;
    }
    if (t == _i7.LoginResponse) {
      return _i7.LoginResponse.fromJson(data) as T;
    }
    if (t == _i8.User) {
      return _i8.User.fromJson(data) as T;
    }
    if (t == _i9.UserProfile) {
      return _i9.UserProfile.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.AuthErrorType?>()) {
      return (data != null ? _i2.AuthErrorType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Gender?>()) {
      return (data != null ? _i3.Gender.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Example?>()) {
      return (data != null ? _i4.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.AuthException?>()) {
      return (data != null ? _i5.AuthException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.OtpVerification?>()) {
      return (data != null ? _i6.OtpVerification.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.LoginResponse?>()) {
      return (data != null ? _i7.LoginResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.User?>()) {
      return (data != null ? _i8.User.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.UserProfile?>()) {
      return (data != null ? _i9.UserProfile.fromJson(data) : null) as T;
    }
    try {
      return _i10.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.AuthErrorType) {
      return 'AuthErrorType';
    }
    if (data is _i3.Gender) {
      return 'Gender';
    }
    if (data is _i4.Example) {
      return 'Example';
    }
    if (data is _i5.AuthException) {
      return 'AuthException';
    }
    if (data is _i6.OtpVerification) {
      return 'OtpVerification';
    }
    if (data is _i7.LoginResponse) {
      return 'LoginResponse';
    }
    if (data is _i8.User) {
      return 'User';
    }
    if (data is _i9.UserProfile) {
      return 'UserProfile';
    }
    className = _i10.Protocol().getClassNameForObject(data);
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
    if (dataClassName == 'AuthErrorType') {
      return deserialize<_i2.AuthErrorType>(data['data']);
    }
    if (dataClassName == 'Gender') {
      return deserialize<_i3.Gender>(data['data']);
    }
    if (dataClassName == 'Example') {
      return deserialize<_i4.Example>(data['data']);
    }
    if (dataClassName == 'AuthException') {
      return deserialize<_i5.AuthException>(data['data']);
    }
    if (dataClassName == 'OtpVerification') {
      return deserialize<_i6.OtpVerification>(data['data']);
    }
    if (dataClassName == 'LoginResponse') {
      return deserialize<_i7.LoginResponse>(data['data']);
    }
    if (dataClassName == 'User') {
      return deserialize<_i8.User>(data['data']);
    }
    if (dataClassName == 'UserProfile') {
      return deserialize<_i9.UserProfile>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i10.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
