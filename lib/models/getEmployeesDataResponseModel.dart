import 'package:json_annotation/json_annotation.dart';
part 'getEmployeesDataResponseModel.g.dart';

@JsonSerializable()
class EmployeesDataResponseModel {
  List<Data>? data;
  Page? page;

  EmployeesDataResponseModel({
    this.data,
    this.page,
  });
  factory EmployeesDataResponseModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeesDataResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeesDataResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  // ignore: non_constant_identifier_names
  String? emp_id;
  String? name;
  Address? address;
  Contact? contact;

  Data({
    // ignore: non_constant_identifier_names
    this.emp_id,
    this.name,
    this.address,
    this.contact,
  });
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
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

@JsonSerializable()
class Page {
  int? total;
  int? nextOffset;
  int? previousOffset;
  int? limit;

  Page({
    this.total,
    this.nextOffset,
    this.previousOffset,
    this.limit,
  });
  factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);

  Map<String, dynamic> toJson() => _$PageToJson(this);
}
