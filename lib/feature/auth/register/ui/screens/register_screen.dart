import 'package:e_storex/core/helper/extentions.dart';
import 'package:e_storex/core/helper/spacing.dart';
import 'package:e_storex/core/resources/strings_manager.dart';
import 'package:e_storex/core/theme/styles_manager.dart';
import 'package:e_storex/feature/auth/register/data/models/register_request_model.dart';
import 'package:e_storex/feature/auth/register/logic/cubit/register_cubit.dart';
import 'package:e_storex/feature/auth/register/ui/widgets/already_have%20an_account.dart';
import 'package:e_storex/feature/auth/register/ui/widgets/custom_app_button.dart';
import 'package:e_storex/feature/auth/register/ui/widgets/register_bloc_listener.dart';
import 'package:e_storex/feature/auth/register/ui/widgets/registerion_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                  Text(
                    AppStrings.createAccount,
                    style: StylesManager.getTitleStyle(),
                  ),
                  verticalSpace(8),
                  Text(
                    AppStrings.createAccountDesc,
                    style: StylesManager.getSubtitleStyle(),
                  ),
                  verticalSpace(15),
                  // ✅ النموذج
                  const RegistertionForm(),
                  verticalSpace(32),
                  // ✅ زر التسجيل
                  CustomAppButton(
                    onPressed: () {
                      final cubit = context.read<RegisterCubit>();
                      if (cubit.formKey.currentState!.validate()) {
                        cubit.registerUser(
                          registerRequestModel: RegisterRequestModel(
                            userName: cubit.nameController.text,
                            email: cubit.emailController.text,
                            phone: cubit.phoneController.text,
                            password: cubit.passwordController.text,
                            confirmPassword:
                                cubit.passwordConfirmationController.text,
                          ),
                        );
                      }
                    },
                    buttonText: AppStrings.register,
                  ),
                  verticalSpace(16),
                  AlreadyHaveAnAccount(
                    text: 'Already have an account? ',
                    onTap: () {
                      context.pop();
                    },
                    screenName: "Login",
                  ),
                  verticalSpace(16),
                  // ✅ Bloc Listener
                  const RegisterBlocListener(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
