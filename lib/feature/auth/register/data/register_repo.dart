import 'package:e_storex/core/networking/api_result.dart';
import 'package:e_storex/core/networking/error_handler.dart';
import 'package:e_storex/core/networking/estorex_api_service.dart';
import 'package:e_storex/feature/auth/register/data/models/auth_response_model.dart';
import 'package:e_storex/feature/auth/register/data/models/register_request_model.dart';

class RegisterRepo {
  final EstorexApiService apiService;
  RegisterRepo({required this.apiService});
  Future<ApiResult<AuthResponseModel>> registerUser(
    RegisterRequestModel registerRequestModel,
  ) async {
    try {
      final response = await apiService.registerUser(registerRequestModel);
      return ApiResult.success(response);
    } catch (e) {
      final apiError = ErrorHandler.handle(e);
      return ApiResult.failure(apiError);
    }
  }
}
