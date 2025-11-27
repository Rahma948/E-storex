import 'package:bloc/bloc.dart';
import 'package:e_storex/feature/home/data/models/product_model.dart';
import 'package:meta/meta.dart';
import 'package:e_storex/feature/home/data/repos/home_repo.dart';
import 'package:e_storex/feature/shop/categories/data/models/category_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;

  HomeCubit(this.homeRepo) : super(HomeInitial());

  List<ProductModel> bestSellingProducts = [];
  List<ProductModel> featuredProducts = [];
  List<CategoryModel> categories = [];

  /// ✅ تجيب كل داتا الـ Home مرة واحدة
  Future<void> getHomeData({int bestSellersCount = 10}) async {
    emit(HomeLoading());

    final bestResult =
        await homeRepo.getBestSellingProducts(count: bestSellersCount);
    final featuredResult = await homeRepo.getFeaturedProducts();
    final categoriesResult = await homeRepo.getAllCategories();

    final isBestOk = bestResult.isSuccess && bestResult.data != null;
    final isFeaturedOk =
        featuredResult.isSuccess && featuredResult.data != null;
    final isCategoriesOk =
        categoriesResult.isSuccess && categoriesResult.data != null;

    if (isBestOk && isFeaturedOk && isCategoriesOk) {
      bestSellingProducts = bestResult.data!;
      featuredProducts = featuredResult.data!;
      categories = categoriesResult.data!;

      emit(
        HomeSuccess(
          bestSellingProducts: bestSellingProducts,
          featuredProducts: featuredProducts,
          categories: categories,
        ),
      );
    } else {
      final errorMessage =
          bestResult.errorMessage ??
          featuredResult.errorMessage ??
          categoriesResult.errorMessage ??
          'Unexpected error';
      emit(HomeFailure(errorMessage));
    }
  }

  /// ⬇️ لو حابب تستخدمهم منفصلين (اختياري)

  Future<void> getBestSellers({int count = 10}) async {
    emit(HomeBestSellersLoading());

    final result = await homeRepo.getBestSellingProducts(count: count);

    if (result.isSuccess && result.data != null) {
      bestSellingProducts = result.data!;
      emit(HomeBestSellersSuccess(bestSellingProducts));
    } else {
      emit(HomeBestSellersFailure(result.errorMessage));
    }
  }

  Future<void> getFeatured() async {
    emit(HomeFeaturedLoading());

    final result = await homeRepo.getFeaturedProducts();

    if (result.isSuccess && result.data != null) {
      featuredProducts = result.data!;
      emit(HomeFeaturedSuccess(featuredProducts));
    } else {
      emit(HomeFeaturedFailure(result.errorMessage));
    }
  }

  Future<void> getCategories() async {
    emit(HomeCategoriesLoading());

    final result = await homeRepo.getAllCategories();

    if (result.isSuccess && result.data != null) {
      categories = result.data!;
      emit(HomeCategoriesSuccess(categories));
    } else {
      emit(HomeCategoriesFailure(result.errorMessage));
    }
  }
}
