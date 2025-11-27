part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

/// ✅ Loading عام للهوم كلها
class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<ProductModel> bestSellingProducts;
  final List<ProductModel> featuredProducts;
  final List<CategoryModel> categories;

  HomeSuccess({
    required this.bestSellingProducts,
    required this.featuredProducts,
    required this.categories,
  });
}

class HomeFailure extends HomeState {
  final String? message;
  HomeFailure(this.message);
}

/// ✅ Top Selling فقط
class HomeBestSellersLoading extends HomeState {}

class HomeBestSellersSuccess extends HomeState {
  final List<ProductModel> bestSellingProducts;
  HomeBestSellersSuccess(this.bestSellingProducts);
}

class HomeBestSellersFailure extends HomeState {
  final String? message;
  HomeBestSellersFailure(this.message);
}

/// ✅ Featured فقط
class HomeFeaturedLoading extends HomeState {}

class HomeFeaturedSuccess extends HomeState {
  final List<ProductModel> featuredProducts;
  HomeFeaturedSuccess(this.featuredProducts);
}

class HomeFeaturedFailure extends HomeState {
  final String? message;
  HomeFeaturedFailure(this.message);
}

/// ✅ Categories فقط
class HomeCategoriesLoading extends HomeState {}

class HomeCategoriesSuccess extends HomeState {
  final List<CategoryModel> categories;
  HomeCategoriesSuccess(this.categories);
}

class HomeCategoriesFailure extends HomeState {
  final String? message;
  HomeCategoriesFailure(this.message);
}
