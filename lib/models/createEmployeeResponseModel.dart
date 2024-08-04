import 'package:json_annotation/json_annotation.dart';
part 'createEmployeeResponseModel.g.dart';

@JsonSerializable()
class CreateEmployeeResponseModel {
  String? id;

  CreateEmployeeResponseModel({this.id});
  factory CreateEmployeeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CreateEmployeeResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateEmployeeResponseModelToJson(this);
}
