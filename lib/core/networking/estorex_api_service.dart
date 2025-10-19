import 'package:dio/dio.dart';
import 'package:e_storex/core/networking/api_constants.dart';
import 'package:e_storex/feature/auth/register/data/models/auth_response_model.dart';
import 'package:e_storex/feature/auth/register/data/models/register_request_model.dart';
import 'package:retrofit/http.dart';

part 'estorex_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class EstorexApiService {
  factory EstorexApiService(Dio dio, {String baseUrl}) = _EstorexApiService;

  @POST(ApiConstants.register)
  Future<AuthResponseModel> registerUser(
    @Body() RegisterRequestModel registerRequestModel,
  );

  // get
  // post
  // delete

  // put patch
}
