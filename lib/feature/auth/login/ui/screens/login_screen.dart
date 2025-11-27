import 'package:e_storex/core/helper/extentions.dart';
import 'package:e_storex/core/helper/spacing.dart';
import 'package:e_storex/core/resources/strings_manager.dart';
import 'package:e_storex/core/routing/routes.dart';
import 'package:e_storex/core/theme/styles_manager.dart';
import 'package:e_storex/feature/auth/login/data/models/login_body_request.dart';
import 'package:e_storex/feature/auth/login/logic/cubit/login_cubit.dart';
import 'package:e_storex/feature/auth/login/ui/widgets/another_login.dart';
import 'package:e_storex/feature/auth/login/ui/widgets/login_bloc_listener.dart';
import 'package:e_storex/feature/auth/login/ui/widgets/login_form.dart';
import 'package:e_storex/feature/auth/register/ui/widgets/already_have%20an_account.dart';
import 'package:e_storex/feature/auth/register/ui/widgets/custom_app_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset('assets/images/image.png', fit: BoxFit.cover),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(AppStrings.login, style: StylesManager.getTitleStyle()),
                  verticalSpace(8),
                  Text(
                    AppStrings.loginToAccountDesc,
                    style: StylesManager.getSubtitleStyle(),
                  ),
                  verticalSpace(15),
                  // ✅ النموذج
                  const LoginForm(),
                  verticalSpace(32),
                  // ✅ زر التسجيل
                  CustomAppButton(
                    onPressed: () {
                      final cubit = context.read<LoginCubit>();
                      if (cubit.formKey.currentState!.validate()) {
                        cubit.loginUser(
                          LoginRequestBody(
                            email: cubit.emailController.text,
                            password: cubit.passwordController.text,
                            rememberMe: cubit.rememberMe,
                          ),
                        );
                      }
                    },
                    buttonText: AppStrings.login,
                  ),
                  verticalSpace(15),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        context.pushNamed(Routes.forgetPassword);
                      },
                      child: Text(
                        'Forget Password ?',
                        style: StylesManager.getBlueLinkText(),
                      ),
                    ),
                  ),
                  verticalSpace(30),
                  _orDividerText(),
                  verticalSpace(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LoginWithGoogleOrGithub(
                        imagePath: 'assets/images/google.png',
                        onTap: () {
                          context.read<LoginCubit>().loginWithSocialProvider(
                            'google',
                          );
                        },
                      ),
                      horizontalSpace(30),
                      LoginWithGoogleOrGithub(
                        imagePath: 'assets/images/github.png',
                        onTap: () => {
                          context.read<LoginCubit>().loginWithSocialProvider(
                            'github',
                          ),
                        },
                      ),
                    ],
                  ),
                  verticalSpace(30),
                  AlreadyHaveAnAccount(
                    text: 'Don;\'t have an account? ',
                    onTap: () {
                      context.pushNamed(Routes.register);
                    },
                    screenName: 'Register',
                  ),
                  verticalSpace(16),

                  // ✅ Bloc Listener
                  LoginBlocListener(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _orDividerText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 100.w,
          child: Divider(color: Colors.grey, thickness: 1),
        ),
        horizontalSpace(5),
        Text(
          'OR',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14.sp, color: Colors.black),
        ),
        horizontalSpace(5),
        SizedBox(
          width: 100.w,
          child: Divider(color: Colors.grey, thickness: 1),
        ),
      ],
    );
  }
}
