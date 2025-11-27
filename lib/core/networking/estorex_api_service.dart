// ⛔ نخفي HttpResponse بتاع dart:io
import 'package:dio/dio.dart';
import 'package:e_storex/core/networking/api_constants.dart';
import 'package:e_storex/feature/auth/forgetPass/data/models/forget_pass_model.dart';
import 'package:e_storex/feature/auth/login/data/models/login_body_request.dart';
import 'package:e_storex/feature/auth/register/data/models/auth_response_model.dart';
import 'package:e_storex/feature/auth/register/data/models/register_request_model.dart';
import 'package:e_storex/feature/home/data/models/best_sellers_response.dart';
import 'package:e_storex/feature/home/data/models/filtered_products_response.dart';
import 'package:e_storex/feature/home/data/models/product_model.dart';
import 'package:e_storex/feature/shop/categories/data/models/category_model.dart';
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

  // ---------------------------------------------------------------------------
  // 🟣 CATEGORIES
  // ---------------------------------------------------------------------------

  @GET(ApiConstants.categories)
  Future<List<CategoryModel>> getAllCategories();

  @GET("${ApiConstants.categories}/{id}")
  Future<CategoryModel> getCategoryById(@Path("id") String id);

  // @POST(ApiConstants.categories)
  // Future<void> createNewCategory(@Body() Map<String, dynamic> category);

  // @PUT("${ApiConstants.categories}/{id}")
  // Future<void> updateCategoryById(
  //   @Path("id") String id,
  //   @Body() Map<String, dynamic> category,
  // );

  // @DELETE("${ApiConstants.categories}/{id}")
  // Future<void> deleteCategoryById(@Path("id") String id);
  // ---------------------------------------------------------------------------
  // 🟡 PRODUCTS
  // ---------------------------------------------------------------------------

  @GET(ApiConstants.products)
  Future<FilteredProductsResponse> getFilteredProducts(
    @Queries() Map<String, dynamic> filters,
  );

  @GET("${ApiConstants.products}/best-sellers")
  Future<BestSellersResponse> getBestSellingProducts(@Query('count') int count);

  @GET("${ApiConstants.products}/featured")
  Future<List<ProductModel>> getFeaturedProducts();

  @GET("${ApiConstants.products}/{id}")
  Future<ProductModel> getProductById(@Path("id") String id);

  // @MultiPart()
  // @POST(ApiConstants.products)
  // Future<ProductModel> createProductWithImages(
  //   @Part(name: "name") String name,
  //   @Part(name: "description") String description,
  //   @Part(name: "newPrice") double newPrice,
  //   @Part(name: "oldPrice") double oldPrice,
  //   @Part(name: "categoryId") String categoryId,
  //   @Part(name: "photos") List<MultipartFile> photos,
  //   @Part(name: "quantityAvailable") int quantityAvailable,
  //   @Part(name: "brandName") String brandName,
  // );

  // @MultiPart()
  // @PUT("${ApiConstants.products}/{id}")
  // Future<void> updateProductWithImagesById(
  //   @Path("id") String id,
  //   @Part(name: "name") String name,
  //   @Part(name: "description") String description,
  //   @Part(name: "newPrice") double newPrice,
  //   @Part(name: "oldPrice") double oldPrice,
  //   @Part(name: "categoryId") String categoryId,
  //   @Part(name: "photos") List<MultipartFile> photos,
  // );

  // @DELETE("${ApiConstants.products}/{basketId}")
  // Future<void> deleteProductById(@Path("basketId") String basketId);
}
