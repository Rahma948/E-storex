import 'package:e_storex/core/networking/api_result.dart';
import 'package:e_storex/core/networking/error_handler.dart';
import 'package:e_storex/core/networking/estorex_api_service.dart';
import 'package:e_storex/feature/auth/login/data/models/login_body_request.dart';
import 'package:e_storex/feature/auth/register/data/models/auth_response_model.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';

class LoginRepo {
  final EstorexApiService apiService;

  LoginRepo(this.apiService);

  /// ✅ تسجيل الدخول العادي
  Future<ApiResult> loginUser(LoginRequestBody loginRequestBody) async {
    try {
      final response = await apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<AuthResponseModel>> loginWithSocialProvider(
    String provider,
  ) async {
    try {
      const clientId = '0ae2b8a1-7508-46dd-9b60-517917efe6b6';
      const appScheme = 'estorex';
      final authUrl =
          'https://estorex.runasp.net/api/v1/Account/external-login?provider=$provider&clientId=$clientId';

      final result = await FlutterWebAuth2.authenticate(
        url: authUrl,
        callbackUrlScheme: appScheme,
      );

      print('📩 Redirect result: $result');

      final uri = Uri.parse(result);

      final token = uri.queryParameters['token'];
      if (token != null && token.isNotEmpty) {
        final successModel = AuthResponseModel(
          token: token,
          refreshToken: uri.queryParameters['refreshToken'],
          message: 'Login successful',
          userName: uri.queryParameters['userName'],
          email: uri.queryParameters['email'],
        );
        return ApiResult.success(successModel);
      } else {
        return ApiResult.failure(
          ErrorHandler.handle('Missing token or invalid redirect'),
        );
      }
    } catch (e) {
      print('⚠️ Social login threw exception: $e');
      // ✅ بدل ما نعتبرها Error، نرجع success فاضي (عشان الديب لينك هيكمل)
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
