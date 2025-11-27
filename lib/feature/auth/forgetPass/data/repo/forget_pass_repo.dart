import 'package:e_storex/core/networking/api_error_model.dart';
import 'package:e_storex/core/networking/api_result.dart';
import 'package:e_storex/core/networking/estorex_api_service.dart';
import 'package:e_storex/feature/auth/forgetPass/data/models/forget_pass_model.dart';
import 'package:e_storex/feature/auth/register/data/models/auth_response_model.dart';

class ForgetPassRepo {
  final EstorexApiService apiService;

  ForgetPassRepo(this.apiService);

  Future<ApiResult<AuthResponseModel>> forgetPassword(
    ForgetPassModel forgetPassModel,
  ) async {
    try {
      final response = await apiService.forgetPassword(forgetPassModel);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorModel(message: e.toString()));
    }
  }
}
