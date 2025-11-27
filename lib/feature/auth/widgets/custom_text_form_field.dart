import 'package:e_storex/core/theme/colors_manager.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.labelText,
    required this.controller,
    required this.validator,
    this.keyboardType = TextInputType.text,
  });

  final String labelText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final isPasswordField = widget.labelText.toLowerCase().contains('password');

    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      style: const TextStyle(color: AppColors.black),
      obscureText: isPasswordField ? _obscureText : false,
      keyboardType: widget.keyboardType,
      textInputAction: TextInputAction.done,
      autofocus: false,
      scrollPadding: const EdgeInsets.all(20),
      enableInteractiveSelection: true,
      decoration: InputDecoration(
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.black),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.black),
        ),
        labelText: widget.labelText,
        labelStyle: const TextStyle(color: AppColors.black),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.black),
        ),
        suffixIcon: isPasswordField
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.black,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
    );
  }
}
