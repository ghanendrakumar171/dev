import 'package:json_annotation/json_annotation.dart';
part 'createEmployeeRequestModel.g.dart';

@JsonSerializable()
class CreateEmployeeRequestModel {
  String? name;
  Address? address;
  Contact? contact;

  CreateEmployeeRequestModel({
    this.name,
    this.address,
    this.contact,
  });
  factory CreateEmployeeRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateEmployeeRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateEmployeeRequestModelToJson(this);
}

@JsonSerializable()
class Address {
  String? line1;
  String? city;
  String? country;
  String? zipCode;

  Address({
    this.line1,
    this.city,
    this.country,
    this.zipCode,
  });
  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonSerializable()
class Contact {
  String? email;
  String? phone;

  Contact({
    this.email,
    this.phone,
  });
  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  Map<String, dynamic> toJson() => _$ContactToJson(this);
}
