import 'package:e_storex/core/helper/spacing.dart';
import 'package:e_storex/core/resources/strings_manager.dart';
import 'package:e_storex/feature/auth/register/data/models/register_request_model.dart';
import 'package:e_storex/feature/auth/register/logic/cubit/register_cubit.dart';
import 'package:e_storex/feature/auth/register/ui/widgets/register_bloc_listener.dart';
import 'package:e_storex/feature/auth/register/ui/widgets/register_button.dart';
import 'package:e_storex/feature/auth/register/ui/widgets/registerion_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.register), centerTitle: true),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ✅ النموذج
              const RegistertionForm(),
              verticalSpace(32),
              // ✅ زر التسجيل
              RegisterButton(
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
              _orDividerText(),
              verticalSpace(16),
              // ✅ Bloc Listener
              const RegisterBlocListener(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _orDividerText() {
    return Text(
      'OR',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 14.sp, color: Colors.black),
    );
  }
}
