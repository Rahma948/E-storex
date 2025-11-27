import 'package:e_storex/core/theme/styles_manager.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({
    super.key,
    required this.text,
    required this.onTap,
    required this.screenName,
  });
  final String text;
  final String screenName;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: StylesManager.getSubtitleStyle()),
        GestureDetector(
          onTap: onTap,
          child: Text(screenName, style: StylesManager.getSmallStyleBlack()),
        ),
      ],
    );
  }
}
