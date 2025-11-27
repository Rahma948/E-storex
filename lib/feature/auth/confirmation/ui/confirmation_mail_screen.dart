import 'package:e_storex/core/helper/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmationMailScreen extends StatelessWidget {
  const ConfirmationMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/Bubbles.png', fit: BoxFit.contain),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/confirmation.png',
                  width: 250.w,
                  height: 150.h,
                ),
                verticalSpace(20),
                Center(
                  child: Text(
                    'A confirmation mail has been sent to your email address. Please check your inbox to verify your account.',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
