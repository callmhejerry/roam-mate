import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roam_mate_flutter/src/app_router.dart';
import 'package:roam_mate_flutter/src/features/authentication/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:roam_mate_flutter/src/features/authentication/presentation/blocs/auth_bloc/auth_event.dart';
import 'package:roam_mate_flutter/src/features/authentication/presentation/blocs/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:roam_mate_flutter/src/features/authentication/presentation/blocs/login_bloc/login_bloc.dart';
import 'package:roam_mate_flutter/src/features/authentication/presentation/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:roam_mate_flutter/src/locator.dart';
import 'package:roam_mate_flutter/src/theme/app_theme.dart';

class RoamMate extends StatelessWidget {
  const RoamMate({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final bloc = getIt.get<AuthBloc>();
            return bloc..add(AuthGetUserEvent());
          },
        ),
        BlocProvider(create: (context) {
          return getIt.get<LoginBloc>();
        }),
        BlocProvider(create: (context) {
          return getIt.get<SignUpBloc>();
        }),
        BlocProvider(
          create: (context) {
            return ForgotPasswordBloc(
              authRepository: getIt(),
            );
          },
        )
      ],
      child: ScreenUtilInit(
        designSize: Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        // useInheritedMediaQuery: true,

        builder: (context, child) {
          return MaterialApp.router(
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
            title: 'Roam Mate',
            theme: AppTheme.defaultTheme,
          );
        },
      ),
    );
  }
}
