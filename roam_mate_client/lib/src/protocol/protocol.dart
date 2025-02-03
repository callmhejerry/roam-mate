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
import 'dto/amenties.dart' as _i2;
import 'dto/example.dart' as _i3;
import 'dto/otp_verification.dart' as _i4;
import 'dto/property.dart' as _i5;
import 'dto/property_amenities.dart' as _i6;
import 'dto/property_review.dart' as _i7;
import 'dto/room.dart' as _i8;
import 'dto/room_amenities.dart' as _i9;
import 'dto/user.dart' as _i10;
import 'dto/user_profile_model.dart' as _i11;
import 'enums/auth_error_type_enum.dart' as _i12;
import 'enums/gender_enum.dart' as _i13;
import 'enums/property_status_enum.dart' as _i14;
import 'enums/property_type_enum.dart' as _i15;
import 'enums/room_type_enum.dart' as _i16;
import 'exceptions/auth_exception.dart' as _i17;
import 'response/login_response.dart' as _i18;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i19;
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
    if (t == _i2.Amenity) {
      return _i2.Amenity.fromJson(data) as T;
    }
    if (t == _i3.Example) {
      return _i3.Example.fromJson(data) as T;
    }
    if (t == _i4.OtpVerification) {
      return _i4.OtpVerification.fromJson(data) as T;
    }
    if (t == _i5.Property) {
      return _i5.Property.fromJson(data) as T;
    }
    if (t == _i6.PropertyAmenitites) {
      return _i6.PropertyAmenitites.fromJson(data) as T;
    }
    if (t == _i7.PropertyReview) {
      return _i7.PropertyReview.fromJson(data) as T;
    }
    if (t == _i8.Room) {
      return _i8.Room.fromJson(data) as T;
    }
    if (t == _i9.RoomAmenitites) {
      return _i9.RoomAmenitites.fromJson(data) as T;
    }
    if (t == _i10.User) {
      return _i10.User.fromJson(data) as T;
    }
    if (t == _i11.UserProfile) {
      return _i11.UserProfile.fromJson(data) as T;
    }
    if (t == _i12.AuthErrorType) {
      return _i12.AuthErrorType.fromJson(data) as T;
    }
    if (t == _i13.Gender) {
      return _i13.Gender.fromJson(data) as T;
    }
    if (t == _i14.PropertyStatus) {
      return _i14.PropertyStatus.fromJson(data) as T;
    }
    if (t == _i15.PropertyType) {
      return _i15.PropertyType.fromJson(data) as T;
    }
    if (t == _i16.RoomType) {
      return _i16.RoomType.fromJson(data) as T;
    }
    if (t == _i17.AuthException) {
      return _i17.AuthException.fromJson(data) as T;
    }
    if (t == _i18.LoginResponse) {
      return _i18.LoginResponse.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Amenity?>()) {
      return (data != null ? _i2.Amenity.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Example?>()) {
      return (data != null ? _i3.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.OtpVerification?>()) {
      return (data != null ? _i4.OtpVerification.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Property?>()) {
      return (data != null ? _i5.Property.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.PropertyAmenitites?>()) {
      return (data != null ? _i6.PropertyAmenitites.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.PropertyReview?>()) {
      return (data != null ? _i7.PropertyReview.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Room?>()) {
      return (data != null ? _i8.Room.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.RoomAmenitites?>()) {
      return (data != null ? _i9.RoomAmenitites.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.User?>()) {
      return (data != null ? _i10.User.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.UserProfile?>()) {
      return (data != null ? _i11.UserProfile.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.AuthErrorType?>()) {
      return (data != null ? _i12.AuthErrorType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.Gender?>()) {
      return (data != null ? _i13.Gender.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.PropertyStatus?>()) {
      return (data != null ? _i14.PropertyStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.PropertyType?>()) {
      return (data != null ? _i15.PropertyType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.RoomType?>()) {
      return (data != null ? _i16.RoomType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.AuthException?>()) {
      return (data != null ? _i17.AuthException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.LoginResponse?>()) {
      return (data != null ? _i18.LoginResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i6.PropertyAmenitites>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i6.PropertyAmenitites>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i9.RoomAmenitites>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i9.RoomAmenitites>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList()
          as dynamic;
    }
    try {
      return _i19.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.Amenity) {
      return 'Amenity';
    }
    if (data is _i3.Example) {
      return 'Example';
    }
    if (data is _i4.OtpVerification) {
      return 'OtpVerification';
    }
    if (data is _i5.Property) {
      return 'Property';
    }
    if (data is _i6.PropertyAmenitites) {
      return 'PropertyAmenitites';
    }
    if (data is _i7.PropertyReview) {
      return 'PropertyReview';
    }
    if (data is _i8.Room) {
      return 'Room';
    }
    if (data is _i9.RoomAmenitites) {
      return 'RoomAmenitites';
    }
    if (data is _i10.User) {
      return 'User';
    }
    if (data is _i11.UserProfile) {
      return 'UserProfile';
    }
    if (data is _i12.AuthErrorType) {
      return 'AuthErrorType';
    }
    if (data is _i13.Gender) {
      return 'Gender';
    }
    if (data is _i14.PropertyStatus) {
      return 'PropertyStatus';
    }
    if (data is _i15.PropertyType) {
      return 'PropertyType';
    }
    if (data is _i16.RoomType) {
      return 'RoomType';
    }
    if (data is _i17.AuthException) {
      return 'AuthException';
    }
    if (data is _i18.LoginResponse) {
      return 'LoginResponse';
    }
    className = _i19.Protocol().getClassNameForObject(data);
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
      return deserialize<_i2.Amenity>(data['data']);
    }
    if (dataClassName == 'Example') {
      return deserialize<_i3.Example>(data['data']);
    }
    if (dataClassName == 'OtpVerification') {
      return deserialize<_i4.OtpVerification>(data['data']);
    }
    if (dataClassName == 'Property') {
      return deserialize<_i5.Property>(data['data']);
    }
    if (dataClassName == 'PropertyAmenitites') {
      return deserialize<_i6.PropertyAmenitites>(data['data']);
    }
    if (dataClassName == 'PropertyReview') {
      return deserialize<_i7.PropertyReview>(data['data']);
    }
    if (dataClassName == 'Room') {
      return deserialize<_i8.Room>(data['data']);
    }
    if (dataClassName == 'RoomAmenitites') {
      return deserialize<_i9.RoomAmenitites>(data['data']);
    }
    if (dataClassName == 'User') {
      return deserialize<_i10.User>(data['data']);
    }
    if (dataClassName == 'UserProfile') {
      return deserialize<_i11.UserProfile>(data['data']);
    }
    if (dataClassName == 'AuthErrorType') {
      return deserialize<_i12.AuthErrorType>(data['data']);
    }
    if (dataClassName == 'Gender') {
      return deserialize<_i13.Gender>(data['data']);
    }
    if (dataClassName == 'PropertyStatus') {
      return deserialize<_i14.PropertyStatus>(data['data']);
    }
    if (dataClassName == 'PropertyType') {
      return deserialize<_i15.PropertyType>(data['data']);
    }
    if (dataClassName == 'RoomType') {
      return deserialize<_i16.RoomType>(data['data']);
    }
    if (dataClassName == 'AuthException') {
      return deserialize<_i17.AuthException>(data['data']);
    }
    if (dataClassName == 'LoginResponse') {
      return deserialize<_i18.LoginResponse>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i19.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
