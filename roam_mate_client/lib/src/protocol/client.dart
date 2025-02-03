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
import 'dart:async' as _i2;
import 'package:roam_mate_client/src/protocol/dto/user.dart' as _i3;
import 'package:roam_mate_client/src/protocol/response/login_response.dart'
    as _i4;
import 'package:roam_mate_client/src/protocol/dto/room.dart' as _i5;
import 'package:roam_mate_client/src/protocol/dto/user_profile_model.dart'
    as _i6;
import 'package:roam_mate_client/src/protocol/enums/gender_enum.dart' as _i7;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i8;
import 'protocol.dart' as _i9;

/// {@category Endpoint}
class EndpointAuth extends _i1.EndpointRef {
  EndpointAuth(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'auth';

  _i2.Future<_i3.User> createAccount(
    String email,
    String password,
    String username,
    String scope,
  ) =>
      caller.callServerEndpoint<_i3.User>(
        'auth',
        'createAccount',
        {
          'email': email,
          'password': password,
          'username': username,
          'scope': scope,
        },
      );

  _i2.Future<_i3.User?> getSignedInUser() =>
      caller.callServerEndpoint<_i3.User?>(
        'auth',
        'getSignedInUser',
        {},
      );

  _i2.Future<_i4.LoginResponse> verifyOtp(
    String otp,
    String email,
  ) =>
      caller.callServerEndpoint<_i4.LoginResponse>(
        'auth',
        'verifyOtp',
        {
          'otp': otp,
          'email': email,
        },
      );

  _i2.Future<void> resendOtp(String email) => caller.callServerEndpoint<void>(
        'auth',
        'resendOtp',
        {'email': email},
      );

  _i2.Future<bool> sendResetPasswordOtp(String email) =>
      caller.callServerEndpoint<bool>(
        'auth',
        'sendResetPasswordOtp',
        {'email': email},
      );

  _i2.Future<bool> resetPassword(
    String email,
    String otp,
    String newPassword,
  ) =>
      caller.callServerEndpoint<bool>(
        'auth',
        'resetPassword',
        {
          'email': email,
          'otp': otp,
          'newPassword': newPassword,
        },
      );

  _i2.Future<_i4.LoginResponse> login(
    String email,
    String password,
  ) =>
      caller.callServerEndpoint<_i4.LoginResponse>(
        'auth',
        'login',
        {
          'email': email,
          'password': password,
        },
      );

  _i2.Future<bool> logout(int userId) => caller.callServerEndpoint<bool>(
        'auth',
        'logout',
        {'userId': userId},
      );
}

/// {@category Endpoint}
class EndpointExample extends _i1.EndpointRef {
  EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

/// {@category Endpoint}
class EndpointFileUpload extends _i1.EndpointRef {
  EndpointFileUpload(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'fileUpload';

  _i2.Future<String?> getUploadDescription(String path) =>
      caller.callServerEndpoint<String?>(
        'fileUpload',
        'getUploadDescription',
        {'path': path},
      );

  _i2.Future<bool> verifyUpload(String path) => caller.callServerEndpoint<bool>(
        'fileUpload',
        'verifyUpload',
        {'path': path},
      );
}

/// {@category Endpoint}
class EndpointRoom extends _i1.EndpointRef {
  EndpointRoom(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'room';

  _i2.Future<_i5.Room> addRoom(_i5.Room room) =>
      caller.callServerEndpoint<_i5.Room>(
        'room',
        'addRoom',
        {'room': room},
      );
}

/// {@category Endpoint}
class EndpointUserProfile extends _i1.EndpointRef {
  EndpointUserProfile(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'userProfile';

  _i2.Future<bool> checkUsernameIsAvailable(String username) =>
      caller.callServerEndpoint<bool>(
        'userProfile',
        'checkUsernameIsAvailable',
        {'username': username},
      );

  _i2.Future<_i6.UserProfile> updateUserProfile(
    String? firstName,
    String? lastName,
    int? userId,
    int? age,
    _i7.Gender? gender,
    String? courseOfStudy,
    int? yearInSchool,
  ) =>
      caller.callServerEndpoint<_i6.UserProfile>(
        'userProfile',
        'updateUserProfile',
        {
          'firstName': firstName,
          'lastName': lastName,
          'userId': userId,
          'age': age,
          'gender': gender,
          'courseOfStudy': courseOfStudy,
          'yearInSchool': yearInSchool,
        },
      );
}

class Modules {
  Modules(Client client) {
    auth = _i8.Caller(client);
  }

  late final _i8.Caller auth;
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i9.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    auth = EndpointAuth(this);
    example = EndpointExample(this);
    fileUpload = EndpointFileUpload(this);
    room = EndpointRoom(this);
    userProfile = EndpointUserProfile(this);
    modules = Modules(this);
  }

  late final EndpointAuth auth;

  late final EndpointExample example;

  late final EndpointFileUpload fileUpload;

  late final EndpointRoom room;

  late final EndpointUserProfile userProfile;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'auth': auth,
        'example': example,
        'fileUpload': fileUpload,
        'room': room,
        'userProfile': userProfile,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
