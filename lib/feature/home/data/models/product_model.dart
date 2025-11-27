import 'package:e_storex/feature/shop/categories/data/models/photo_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  final String? id;
  final String? name;
  final String? description;
  final double? newPrice;
  final double? oldPrice;
  final String? categoryName;
  final int? quantityAvailable;
  final String? brandName;
  final bool? isFeatured;
  final List<PhotoModel>? photos;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.newPrice,
    required this.oldPrice,
    required this.categoryName,
    required this.photos,
    required this.quantityAvailable,
    required this.isFeatured,
    required this.brandName,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
