import 'package:bloc/bloc.dart';
import 'package:e_storex/feature/auth/login/data/models/login_body_request.dart';
import 'package:e_storex/feature/auth/login/data/repos/login_repo.dart';
import 'package:e_storex/feature/auth/register/data/models/auth_response_model.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super(LoginInitial());

  bool rememberMe = false;
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  final formKey = GlobalKey<FormState>();

  void loginUser(LoginRequestBody loginRequestBody) async {
    emit(LoginLoading());
    final response = await loginRepo.loginUser(loginRequestBody);
    if (response.isSuccess && response.data != null) {
      emit(LoginSuccess(response.data as AuthResponseModel));
    } else {
      emit(LoginFailure(response.errorMessage));
    }
  }

  // Future<void> loginWithSocialProvider(String provider) async {
  //   emit(SocialLoginLoading());
  //   final result = await loginRepo.loginWithSocialProvider(provider);

  //   if (result.isSuccess && result.data != null) {
  //     print(' ${result.data!}');
  //     emit(SocialLoginUrlSuccess(result.data!));
  //   } else {
  //     print('❌ ERROR: ${result.errorMessage}');
  //     emit(SocialLoginError(result.errorMessage));
  //   }
  // }

  Future<void> loginWithSocialProvider(String provider) async {
    emit(SocialLoginLoading());

    final result = await loginRepo.loginWithSocialProvider(provider);
    if (isClosed) return;
    // ✅ هنا نتحقق لو فعلاً رجع موديل فيه token
    if (result.isSuccess && result.data?.token != null) {
      print('✅ Login success via social provider: ${result.data!.userName}');
    } else {
      // ❗ لكن لو حصل redirect والديب لينك هيكمل، ما نطلعش Error هنا
      print('⚠️ Ignoring error, deep link flow may handle success.');
      emit(SocialLoginUrlSuccess(result.data ?? AuthResponseModel()));
    }
  }

  void toggleRememberMe(bool? value) {
    rememberMe = value ?? false;
  }

  void handleExternalLoginSuccess(AuthResponseModel authResponseModel) {
    emit(SocialLoginUrlSuccess(authResponseModel));
  }
}
