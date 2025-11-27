import 'package:e_storex/core/helper/app_regex.dart';
import 'package:e_storex/core/helper/spacing.dart';
import 'package:e_storex/core/theme/colors_manager.dart';
import 'package:e_storex/feature/auth/forgetPass/data/models/forget_pass_model.dart';
import 'package:e_storex/feature/auth/forgetPass/logic/cubit/forget_password_cubit.dart';
import 'package:e_storex/feature/auth/register/ui/widgets/custom_app_button.dart';
import 'package:e_storex/feature/auth/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordForm extends StatefulWidget {
  const ForgetPasswordForm({
    super.key,
    required this.emailcontroller,
    required this.formKey,
  });

  final TextEditingController emailcontroller;

  final GlobalKey<FormState> formKey;

  @override
  State<ForgetPasswordForm> createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
      builder: (context, state) {
        if (state is ForgetPasswordSuccess) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              verticalSpace(150),
              Icon(
                Icons.mark_email_read_rounded,
                color: AppColors.kPrimaryColor,
                size: 100.sp,
              ),
              verticalSpace(20),
              Text(
                'Check your mail',
                style: TextStyle(
                  fontSize: 22.sp,
                  color: AppColors.kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          );
        }
        return Form(
          key: widget.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              verticalSpace(70),
              Image.asset(
                'assets/images/forget_password.png',
                width: 200.w,
                height: 150.h,
              ),
              verticalSpace(0),
              CustomTextFormField(
                labelText: 'Email',
                controller: widget.emailcontroller,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !AppRegex.isEmailValid(value)) {
                    return 'Please enter your email';
                  }
                  // You can add more complex email validation here if needed
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
              ),
              verticalSpace(40),
              CustomAppButton(
                onPressed: () {
                  if (widget.formKey.currentState!.validate()) {
                    context.read<ForgetPasswordCubit>().forgetPassword(
                      ForgetPassModel(email: widget.emailcontroller.text),
                    );
                  }
                },
                buttonText: 'Reset Password',
              ),
            ],
          ),
        );
      },
    );
  }
}
