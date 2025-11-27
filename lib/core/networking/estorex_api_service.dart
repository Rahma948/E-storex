// ⛔ نخفي HttpResponse بتاع dart:io
import 'package:dio/dio.dart';
import 'package:e_storex/core/networking/api_constants.dart';
import 'package:e_storex/feature/auth/forgetPass/data/models/forget_pass_model.dart';
import 'package:e_storex/feature/auth/login/data/models/login_body_request.dart';
import 'package:e_storex/feature/auth/register/data/models/auth_response_model.dart';
import 'package:e_storex/feature/auth/register/data/models/register_request_model.dart';
import 'package:retrofit/retrofit.dart'; // ✅ هنا فيه HttpResponse الصح

part 'estorex_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class EstorexApiService {
  factory EstorexApiService(Dio dio, {String baseUrl}) = _EstorexApiService;

  @POST(ApiConstants.register)
  Future<AuthResponseModel> registerUser(
    @Body() RegisterRequestModel registerRequestModel,
  );

  @POST(ApiConstants.login)
  Future<AuthResponseModel> login(@Body() LoginRequestBody loginRequestBody);

  @GET(ApiConstants.externalLogin)
  Future<HttpResponse<void>> loginWithSocialProvider(
    @Query('provider') String provider,
    @Query('clientId') String clientId,
  );
  @POST(ApiConstants.forgetPassword)
  Future<AuthResponseModel> forgetPassword(
    @Body() ForgetPassModel forgetPassModel,
  );
}
