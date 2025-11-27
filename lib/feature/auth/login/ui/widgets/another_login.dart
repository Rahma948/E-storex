import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginWithGoogleOrGithub extends StatelessWidget {
  const LoginWithGoogleOrGithub({
    super.key,
    required this.imagePath,
    this.onTap,
  });
  final String imagePath;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        radius: 25.r,
        backgroundColor: Colors.grey.shade200,
        child: Image.asset(imagePath, width: 30.w, height: 30.h),
      ),
    );
  }
}
