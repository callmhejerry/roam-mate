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
import '../endpoints/auth_endpoint.dart' as _i2;
import '../endpoints/example_endpoint.dart' as _i3;
import '../endpoints/file_upload_endpoint.dart' as _i4;
import '../endpoints/room_endpoint.dart' as _i5;
import '../endpoints/user_profile_endpoint.dart' as _i6;
import 'package:roam_mate_server/src/generated/dto/room.dart' as _i7;
import 'package:roam_mate_server/src/generated/enums/gender_enum.dart' as _i8;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i9;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'auth': _i2.AuthEndpoint()
        ..initialize(
          server,
          'auth',
          null,
        ),
      'example': _i3.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
      'fileUpload': _i4.FileUploadEndpoint()
        ..initialize(
          server,
          'fileUpload',
          null,
        ),
      'room': _i5.RoomEndpoint()
        ..initialize(
          server,
          'room',
          null,
        ),
      'userProfile': _i6.UserProfileEndpoint()
        ..initialize(
          server,
          'userProfile',
          null,
        ),
    };
    connectors['auth'] = _i1.EndpointConnector(
      name: 'auth',
      endpoint: endpoints['auth']!,
      methodConnectors: {
        'createAccount': _i1.MethodConnector(
          name: 'createAccount',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'username': _i1.ParameterDescription(
              name: 'username',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'scope': _i1.ParameterDescription(
              name: 'scope',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i2.AuthEndpoint).createAccount(
            session,
            params['email'],
            params['password'],
            params['username'],
            params['scope'],
          ),
        ),
        'getSignedInUser': _i1.MethodConnector(
          name: 'getSignedInUser',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i2.AuthEndpoint).getSignedInUser(session),
        ),
        'verifyOtp': _i1.MethodConnector(
          name: 'verifyOtp',
          params: {
            'otp': _i1.ParameterDescription(
              name: 'otp',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i2.AuthEndpoint).verifyOtp(
            session,
            params['otp'],
            params['email'],
          ),
        ),
        'resendOtp': _i1.MethodConnector(
          name: 'resendOtp',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i2.AuthEndpoint).resendOtp(
            session,
            params['email'],
          ),
        ),
        'sendResetPasswordOtp': _i1.MethodConnector(
          name: 'sendResetPasswordOtp',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i2.AuthEndpoint).sendResetPasswordOtp(
            session,
            params['email'],
          ),
        ),
        'resetPassword': _i1.MethodConnector(
          name: 'resetPassword',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'otp': _i1.ParameterDescription(
              name: 'otp',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'newPassword': _i1.ParameterDescription(
              name: 'newPassword',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i2.AuthEndpoint).resetPassword(
            session,
            params['email'],
            params['otp'],
            params['newPassword'],
          ),
        ),
        'login': _i1.MethodConnector(
          name: 'login',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i2.AuthEndpoint).login(
            session,
            params['email'],
            params['password'],
          ),
        ),
        'logout': _i1.MethodConnector(
          name: 'logout',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i2.AuthEndpoint).logout(
            session,
            params['userId'],
          ),
        ),
      },
    );
    connectors['example'] = _i1.EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['example'] as _i3.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    connectors['fileUpload'] = _i1.EndpointConnector(
      name: 'fileUpload',
      endpoint: endpoints['fileUpload']!,
      methodConnectors: {
        'getUploadDescription': _i1.MethodConnector(
          name: 'getUploadDescription',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['fileUpload'] as _i4.FileUploadEndpoint)
                  .getUploadDescription(
            session,
            params['path'],
          ),
        ),
        'verifyUpload': _i1.MethodConnector(
          name: 'verifyUpload',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['fileUpload'] as _i4.FileUploadEndpoint).verifyUpload(
            session,
            params['path'],
          ),
        ),
      },
    );
    connectors['room'] = _i1.EndpointConnector(
      name: 'room',
      endpoint: endpoints['room']!,
      methodConnectors: {
        'addRoom': _i1.MethodConnector(
          name: 'addRoom',
          params: {
            'room': _i1.ParameterDescription(
              name: 'room',
              type: _i1.getType<_i7.Room>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['room'] as _i5.RoomEndpoint).addRoom(
            session,
            params['room'],
          ),
        )
      },
    );
    connectors['userProfile'] = _i1.EndpointConnector(
      name: 'userProfile',
      endpoint: endpoints['userProfile']!,
      methodConnectors: {
        'checkUsernameIsAvailable': _i1.MethodConnector(
          name: 'checkUsernameIsAvailable',
          params: {
            'username': _i1.ParameterDescription(
              name: 'username',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userProfile'] as _i6.UserProfileEndpoint)
                  .checkUsernameIsAvailable(
            session,
            params['username'],
          ),
        ),
        'updateUserProfile': _i1.MethodConnector(
          name: 'updateUserProfile',
          params: {
            'firstName': _i1.ParameterDescription(
              name: 'firstName',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'lastName': _i1.ParameterDescription(
              name: 'lastName',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'age': _i1.ParameterDescription(
              name: 'age',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'gender': _i1.ParameterDescription(
              name: 'gender',
              type: _i1.getType<_i8.Gender?>(),
              nullable: true,
            ),
            'courseOfStudy': _i1.ParameterDescription(
              name: 'courseOfStudy',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'yearInSchool': _i1.ParameterDescription(
              name: 'yearInSchool',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userProfile'] as _i6.UserProfileEndpoint)
                  .updateUserProfile(
            session,
            params['firstName'],
            params['lastName'],
            params['userId'],
            params['age'],
            params['gender'],
            params['courseOfStudy'],
            params['yearInSchool'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i9.Endpoints()..initializeEndpoints(server);
  }
}
