import 'package:e_storex/feature/home/data/models/product_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'best_sellers_response.g.dart';

@JsonSerializable()
class BestSellersResponse {
  final bool success;
  final String? message;
  final int statusCode;
  final List<ProductModel> data;

  BestSellersResponse({
    required this.success,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory BestSellersResponse.fromJson(Map<String, dynamic> json) =>
      _$BestSellersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BestSellersResponseToJson(this);
}
