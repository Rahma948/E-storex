import 'package:e_storex/feature/shop/categories/data/models/photo_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  final String id;
  final String name;
  final String description;
    final List<PhotoModel>? photos;


  CategoryModel({
    required this.id,
    required this.name,
    required this.description,
    required this.photos
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}