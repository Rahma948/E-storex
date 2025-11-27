import 'package:json_annotation/json_annotation.dart';

part 'login_body_request.g.dart';

@JsonSerializable()
class LoginRequestBody {
  final String? email;
  final String? password;
  final bool? rememberMe;

  LoginRequestBody({
    required this.email,
    required this.password,
    this.rememberMe = false,
  });
  Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);
  factory LoginRequestBody.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestBodyFromJson(json);
}
