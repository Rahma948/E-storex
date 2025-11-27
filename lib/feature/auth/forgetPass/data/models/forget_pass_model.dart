import 'package:json_annotation/json_annotation.dart';
part 'forget_pass_model.g.dart';

@JsonSerializable()
class ForgetPassModel {
  final String email;

  ForgetPassModel({required this.email});
  Map<String, dynamic> toJson() => _$ForgetPassModelToJson(this);
}
