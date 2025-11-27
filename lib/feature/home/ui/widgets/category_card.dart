import 'package:e_storex/feature/shop/categories/data/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  final int index;

  const CategoryCard({required this.category, required this.index, super.key});

  String? _buildImageUrl() {
    if (category.photos == null || category.photos!.isEmpty) return null;
    final path = category.photos!.first.imageName?.replaceAll('\\', '/') ?? '';
    return 'https://estorex.runasp.net/$path';
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl = _buildImageUrl();
    final bool imageOnRight = index.isEven; // مرّة يمين مرّة شمال

    return Container(
      height: 95,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 196, 196, 196),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: imageOnRight
            ? _buildRowWithImageRight(imageUrl)
            : _buildRowWithImageLeft(imageUrl),
      ),
    );
  }

  List<Widget> _buildRowWithImageRight(String? imageUrl) {
    return [
      Expanded(
        flex: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: _buildTextSection(),
        ),
      ),
      Expanded(flex: 2, child: _buildImage(imageUrl, rightSide: true)),
    ];
  }

  List<Widget> _buildRowWithImageLeft(String? imageUrl) {
    return [
      Expanded(flex: 2, child: _buildImage(imageUrl, rightSide: false)),
      Expanded(
        flex: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: _buildTextSection(),
        ),
      ),
    ];
  }

  Widget _buildTextSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          category.name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 4),
        Text(
          category.description,
          style: const TextStyle(fontSize: 12),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildImage(String? imageUrl, {required bool rightSide}) {
    return ClipRRect(
      borderRadius: BorderRadius.horizontal(
        left: rightSide ? const Radius.circular(20) : Radius.zero,
        right: rightSide ? Radius.zero : const Radius.circular(20),
      ),
      child: imageUrl == null
          ? Container(
              color: Colors.grey.shade300,
              child: const Icon(Icons.image, size: 40),
            )
          : Image.network(imageUrl, fit: BoxFit.cover, height: double.infinity),
    );
  }
}
