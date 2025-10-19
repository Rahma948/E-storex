import 'package:bloc/bloc.dart';
import 'package:e_storex/feature/auth/register/data/models/auth_response_model.dart';
import 'package:e_storex/feature/auth/register/data/models/register_request_model.dart';
import 'package:e_storex/feature/auth/register/data/register_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.registerRepo}) : super(RegisterInitial());
  final RegisterRepo registerRepo;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();
  Future<void> registerUser({
    required RegisterRequestModel registerRequestModel,
  }) async {
    emit(RegisterLoading());
    final result = await registerRepo.registerUser(registerRequestModel);
    if (result.isSuccess && result.data != null) {
      emit(RegisterSuccess(result.data!));
    } else {
      emit(RegisterFailure(result.errorMessage));
    }
  }
}
