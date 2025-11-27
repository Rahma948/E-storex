part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final AuthResponseModel authResponseModel;
  LoginSuccess(this.authResponseModel);
}

final class LoginFailure extends LoginState {
  final String? errorMessage;
  LoginFailure(this.errorMessage);
}

class SocialLoginLoading extends LoginState {}

class SocialLoginUrlSuccess extends LoginState {
  final AuthResponseModel authResponseModel;
  SocialLoginUrlSuccess(this.authResponseModel);
}

class SocialLoginError extends LoginState {
  final String message;
  SocialLoginError(this.message);
}
