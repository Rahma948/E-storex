import 'package:e_storex/core/helper/extentions.dart';
import 'package:e_storex/core/routing/routes.dart';
import 'package:e_storex/core/theme/colors_manager.dart';
import 'package:e_storex/feature/auth/login/logic/cubit/login_cubit.dart';
import 'package:e_storex/feature/auth/login/ui/screens/external_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) async {
        if (state is SocialLoginUrlSuccess) {
          final userData = state.authResponseModel;

          // اطبعي الداتا اللي جاية مؤقتًا
          print(
            '✅ External Login Done: ${userData.userName}, Token: ${userData.token}',
          );
          Navigator.pushReplacementNamed(context, Routes.home);
        } else if (state is SocialLoginError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is LoginLoading) {
          showDialog(
            context: context,
            builder: (context) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.kPrimaryColor,
                ),
              );
            },
          );
        } else if (state is LoginSuccess) {
          context.pop();
          final authResponse = state.authResponseModel;
          final message = authResponse.message ?? 'Login successful';
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(message)));
          context.read<LoginCubit>().passwordController.clear();
          context.read<LoginCubit>().emailController.clear();
          // Navigate to another screen or perform other actions
        } else if (state is LoginFailure) {
          final errorMessage = state.errorMessage;
          context.pop();
          print('Login failed: $errorMessage');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(errorMessage ?? 'Login failed')),
          );
        }
      },
      child: Container(),
    );
  }
}
