import 'package:e_storex/core/helper/app_regex.dart';
import 'package:e_storex/core/helper/spacing.dart';
import 'package:e_storex/core/theme/colors_manager.dart';
import 'package:e_storex/feature/auth/login/logic/cubit/login_cubit.dart';
import 'package:e_storex/feature/auth/widgets/custom_text_form_field.dart';
import 'package:e_storex/feature/auth/widgets/password_validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final cubit = context.read<LoginCubit>();
      passwordController = cubit.passwordController;
      setupPasswordControllerListener();
    });
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(
          passwordController.text,
        );
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          CustomTextFormField(
            labelText: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
            controller: context.read<LoginCubit>().emailController,
          ),
          verticalSpace(18),
          CustomTextFormField(
            controller: context.read<LoginCubit>().passwordController,
            labelText: 'Password',

            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPasswordValid(value)) {
                return 'Please enter a valid password';
              }
              return null;
            },
          ),
          verticalSpace(10),
          Row(
            children: [
              Checkbox(
                checkColor: AppColors.kPrimaryColor,
                activeColor: AppColors.kPrimaryColor.withAlpha(80),
                value: context.read<LoginCubit>().rememberMe,
                onChanged: (value) {
                  setState(() {
                    context.read<LoginCubit>().toggleRememberMe(value);
                  });
                },
              ),
              const Text('Remember me'),
            ],
          ),

          verticalSpace(20),
          PasswordValidations(
            hasLowerCase: hasLowercase,
            hasUpperCase: hasUppercase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.removeListener(setupPasswordControllerListener);
    super.dispose();
  }
}
