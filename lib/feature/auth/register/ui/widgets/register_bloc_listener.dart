import 'package:e_storex/core/helper/extentions.dart';
import 'package:e_storex/core/routing/routes.dart';
import 'package:e_storex/core/theme/colors_manager.dart';
import 'package:e_storex/feature/auth/register/logic/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBlocListener extends StatelessWidget {
  const RegisterBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          context.pop();

          final authResponse = state.authResponseModel;
          final message = authResponse.message ?? 'Registration successful';
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(message)));
          context.read<RegisterCubit>().passwordController.clear();
          context.read<RegisterCubit>().phoneController.clear();
          context.read<RegisterCubit>().nameController.clear();
          context.read<RegisterCubit>().passwordConfirmationController.clear();
          context.read<RegisterCubit>().emailController.clear();
          context.pushReplacementNamed(Routes.confirmationMailScreen);
          // Navigate to another screen or perform other actions
        } else if (state is RegisterFailure) {
          final errorMessage = state.errorMessage;
          Navigator.of(context, rootNavigator: true).pop();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(errorMessage)));
        } else if (state is RegisterLoading) {
          _showLoadingDialog(context);
        }
      },
      child: const SizedBox.shrink(), // Placeholder for the widget tree
    );
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(
        child: CircularProgressIndicator(color: AppColors.kPrimaryColor),
      ),
    );
  }
}
