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
import '../dto/property.dart' as _i2;
import '../dto/user.dart' as _i3;

abstract class PropertyReview implements _i1.SerializableModel {
  PropertyReview._({
    this.id,
    required this.propertyId,
    this.property,
    required this.studentIdId,
    this.studentId,
    required this.rating,
    required this.comment,
    required this.createdAt,
  });

  factory PropertyReview({
    int? id,
    required int propertyId,
    _i2.Property? property,
    required int studentIdId,
    _i3.User? studentId,
    required double rating,
    required String comment,
    required DateTime createdAt,
  }) = _PropertyReviewImpl;

  factory PropertyReview.fromJson(Map<String, dynamic> jsonSerialization) {
    return PropertyReview(
      id: jsonSerialization['id'] as int?,
      propertyId: jsonSerialization['propertyId'] as int,
      property: jsonSerialization['property'] == null
          ? null
          : _i2.Property.fromJson(
              (jsonSerialization['property'] as Map<String, dynamic>)),
      studentIdId: jsonSerialization['studentIdId'] as int,
      studentId: jsonSerialization['studentId'] == null
          ? null
          : _i3.User.fromJson(
              (jsonSerialization['studentId'] as Map<String, dynamic>)),
      rating: (jsonSerialization['rating'] as num).toDouble(),
      comment: jsonSerialization['comment'] as String,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int propertyId;

  _i2.Property? property;

  int studentIdId;

  _i3.User? studentId;

  double rating;

  String comment;

  DateTime createdAt;

  PropertyReview copyWith({
    int? id,
    int? propertyId,
    _i2.Property? property,
    int? studentIdId,
    _i3.User? studentId,
    double? rating,
    String? comment,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'propertyId': propertyId,
      if (property != null) 'property': property?.toJson(),
      'studentIdId': studentIdId,
      if (studentId != null) 'studentId': studentId?.toJson(),
      'rating': rating,
      'comment': comment,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PropertyReviewImpl extends PropertyReview {
  _PropertyReviewImpl({
    int? id,
    required int propertyId,
    _i2.Property? property,
    required int studentIdId,
    _i3.User? studentId,
    required double rating,
    required String comment,
    required DateTime createdAt,
  }) : super._(
          id: id,
          propertyId: propertyId,
          property: property,
          studentIdId: studentIdId,
          studentId: studentId,
          rating: rating,
          comment: comment,
          createdAt: createdAt,
        );

  @override
  PropertyReview copyWith({
    Object? id = _Undefined,
    int? propertyId,
    Object? property = _Undefined,
    int? studentIdId,
    Object? studentId = _Undefined,
    double? rating,
    String? comment,
    DateTime? createdAt,
  }) {
    return PropertyReview(
      id: id is int? ? id : this.id,
      propertyId: propertyId ?? this.propertyId,
      property:
          property is _i2.Property? ? property : this.property?.copyWith(),
      studentIdId: studentIdId ?? this.studentIdId,
      studentId:
          studentId is _i3.User? ? studentId : this.studentId?.copyWith(),
      rating: rating ?? this.rating,
      comment: comment ?? this.comment,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
