import 'package:e_storex/core/networking/api_result.dart';
import 'package:e_storex/core/networking/error_handler.dart';
import 'package:e_storex/core/networking/estorex_api_service.dart';
import 'package:e_storex/feature/home/data/models/product_model.dart';
import 'package:e_storex/feature/home/data/models/filtered_products_response.dart';
import 'package:e_storex/feature/shop/categories/data/models/category_model.dart';

class HomeRepo {
  final EstorexApiService apiService;

  HomeRepo(this.apiService);

  /// ✅ Top Selling Products (best-sellers)
  Future<ApiResult<List<ProductModel>>> getBestSellingProducts({
    int count = 10,
  }) async {
    try {
      final response = await apiService.getBestSellingProducts(count);
      return ApiResult.success(response.data);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  /// ✅ Featured Products
  Future<ApiResult<List<ProductModel>>> getFeaturedProducts() async {
    try {
      final products = await apiService.getFeaturedProducts();
      return ApiResult.success(products);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  /// ✅ All Categories
  Future<ApiResult<List<CategoryModel>>> getAllCategories() async {
    try {
      final categories = await apiService.getAllCategories();
      return ApiResult.success(categories);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  /// ✅ Category by Id
  Future<ApiResult<CategoryModel>> getCategoryById(String id) async {
    try {
      final category = await apiService.getCategoryById(id);
      return ApiResult.success(category);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  /// 🔍 ✅ Filtered Products (Brand, Category, Price, Search…)
  Future<ApiResult<FilteredProductsResponse>> getFilteredProducts(
    Map<String, dynamic> filters,
  ) async {
    try {
      final response = await apiService.getFilteredProducts(filters);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
