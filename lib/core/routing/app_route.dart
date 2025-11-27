import 'package:e_storex/core/DI/get_it.dart';
import 'package:e_storex/core/routing/routes.dart';
import 'package:e_storex/feature/auth/confirmation/ui/confirmation_mail_screen.dart';
import 'package:e_storex/feature/auth/forgetPass/logic/cubit/forget_password_cubit.dart';
import 'package:e_storex/feature/auth/login/logic/cubit/login_cubit.dart';
import 'package:e_storex/feature/auth/login/ui/screens/login_screen.dart';
import 'package:e_storex/feature/auth/register/logic/cubit/register_cubit.dart';
import 'package:e_storex/feature/auth/register/ui/screens/register_screen.dart';
import 'package:e_storex/feature/auth/forgetPass/ui/forget_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: LoginScreen(),
          ),
        );
      case Routes.register:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<RegisterCubit>(),
            child: RegisterScreen(),
          ),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => Scaffold(appBar: AppBar(title: const Text('Home'))),
        );
      case Routes.forgetPassword:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ForgetPasswordCubit>(),
            child: ForgetPasswordScreen(),
          ),
        );
      case Routes.confirmationMailScreen:
        return MaterialPageRoute(builder: (_) => ConfirmationMailScreen());
      default:
        print('🚨 Unknown route name: ${settings.name}');
        return MaterialPageRoute(
          builder: (_) =>
              Scaffold(body: Center(child: Text('Not Found$settings'))),
        );
    }
  }
}
