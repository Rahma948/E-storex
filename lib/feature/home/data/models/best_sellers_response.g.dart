// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'best_sellers_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BestSellersResponse _$BestSellersResponseFromJson(Map<String, dynamic> json) =>
    BestSellersResponse(
      success: json['success'] as bool,
      message: json['message'] as String?,
      statusCode: (json['statusCode'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BestSellersResponseToJson(
  BestSellersResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'statusCode': instance.statusCode,
  'data': instance.data,
};
