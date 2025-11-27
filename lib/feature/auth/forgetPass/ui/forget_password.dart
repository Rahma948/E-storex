import 'package:e_storex/core/helper/spacing.dart';
import 'package:e_storex/core/resources/strings_manager.dart';
import 'package:e_storex/core/theme/styles_manager.dart';
import 'package:e_storex/feature/auth/forgetPass/ui/widgets/forget_pass_bloc.dart';
import 'package:e_storex/feature/auth/forgetPass/ui/widgets/forget_password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController emailcontroller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset('assets/images/Bubbles.png', fit: BoxFit.cover),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    AppStrings.forgetPassword,
                    style: StylesManager.getTitleStyle(color: Colors.white),
                  ),
                  verticalSpace(8),
                  Text(
                    AppStrings.forgetPasswordSubTitle,
                    style: StylesManager.getSubtitleStyle(
                      color: const Color.fromARGB(255, 190, 189, 189),
                    ),
                  ),
                  verticalSpace(15),

                  ForgetPasswordForm(
                    emailcontroller: emailcontroller,
                    formKey: formKey,
                  ),
                  ForgetPassListener(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
