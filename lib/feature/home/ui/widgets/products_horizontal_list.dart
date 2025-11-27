import 'package:e_storex/feature/home/data/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductsHorizontalList extends StatelessWidget {
  final List<ProductModel> products;
  final void Function(ProductModel product)? onFavoriteTap; // 👈 جديد

  const ProductsHorizontalList({
    required this.products,
    this.onFavoriteTap, // 👈 جديد
    super.key,
  });

  String? _buildImageUrl(ProductModel product) {
    if (product.photos == null || product.photos!.isEmpty) return null;
    final path = product.photos!.first.imageName?.replaceAll('\\', '/') ?? '';
    return 'https://estorex.runasp.net/$path';
  }

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const SizedBox(
        height: 180,
        child: Center(child: Text('No products')),
      );
    }

    return SizedBox(
      height: 240,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final product = products[index];
          final imageUrl = _buildImageUrl(product);

          return Container(
            width: 160,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: imageUrl == null
                            ? Container(
                                color: Colors.grey.shade200,
                                child: const Center(
                                  child: Icon(Icons.image_outlined),
                                ),
                              )
                            : Image.network(
                                imageUrl,
                                fit: BoxFit.contain,
                                width: double.infinity,
                              ),
                      ),

                      // 👇 الأيقونة بقت clickable
                      Positioned(
                        right: 8,
                        top: 8,
                        child: GestureDetector(
                          onTap: () {
                            if (onFavoriteTap != null) {
                              onFavoriteTap!(product);
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.85),
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(4),
                            child: const Icon(Icons.favorite_border, size: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  product.name ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  product.brandName ?? '',
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Text(
                  '${product.newPrice?.toStringAsFixed(0) ?? ''} EGP',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
