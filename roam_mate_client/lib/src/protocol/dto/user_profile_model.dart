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
import '../dto/user.dart' as _i2;
import '../enums/gender_enum.dart' as _i3;

abstract class UserProfile implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  _i2.User? user;

  String? firstName;

  String? lastName;

  _i3.Gender? gender;

  String? courseOfStudy;

  int? yearEntered;

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
