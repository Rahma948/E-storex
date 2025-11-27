import 'package:e_storex/feature/home/data/models/product_model.dart';
import 'package:e_storex/feature/home/ui/widgets/banner_card.dart';
import 'package:e_storex/feature/home/ui/widgets/products_horizontal_list.dart';
import 'package:e_storex/feature/home/ui/widgets/section_title.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  final List<ProductModel> newArrivals;
  final List<ProductModel> bestSellers;

  const HomeTab({
    required this.newArrivals,
    required this.bestSellers,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BannerCard(),
          const SizedBox(height: 20),

          /// 🔥 New Arrivals
          SectionTitle(title: 'New Arrivals 🔥', onSeeAll: () {}),
          const SizedBox(height: 10),
          ProductsHorizontalList(
            products: newArrivals,
            onFavoriteTap: (product) {
              // دلوقتي بس نجرب
              debugPrint('Favorite tapped: ${product.name}');
              // بعدين هنا هتنادي Cubit / Repo تضيفه في الـ favorites
            },
          ),

          const SizedBox(height: 25),

          /// ⭐ Best Sellers
          SectionTitle(title: 'Best Sellers ⭐', onSeeAll: () {}),
          const SizedBox(height: 10),
          ProductsHorizontalList(
            products: bestSellers,
            onFavoriteTap: (product) {
              // دلوقتي بس نجرب
              debugPrint('Favorite tapped: ${product.name}');
              // بعدين هنا هتنادي Cubit / Repo تضيفه في الـ favorites
            },
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
