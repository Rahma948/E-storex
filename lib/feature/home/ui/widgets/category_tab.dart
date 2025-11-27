import 'package:e_storex/feature/home/ui/widgets/category_card.dart';
import 'package:e_storex/feature/shop/categories/data/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryTab extends StatelessWidget {
  final List<CategoryModel> categories;

  const CategoryTab({required this.categories, super.key});

  @override
  Widget build(BuildContext context) {
    if (categories.isEmpty) {
      return const Center(child: Text('No categories'));
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: ListView.separated(
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(height: 14),
        itemBuilder: (context, index) {
          return CategoryCard(category: categories[index], index: index);
        },
      ),
    );
  }
}
