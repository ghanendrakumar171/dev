// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'createEmployeeRequestModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateEmployeeRequestModel _$CreateEmployeeRequestModelFromJson(
        Map<String, dynamic> json) =>
    CreateEmployeeRequestModel(
      name: json['name'] as String?,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      contact: json['contact'] == null
          ? null
          : Contact.fromJson(json['contact'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateEmployeeRequestModelToJson(
        CreateEmployeeRequestModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'contact': instance.contact,
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      line1: json['line1'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      zipCode: json['zipCode'] as String?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'line1': instance.line1,
      'city': instance.city,
      'country': instance.country,
      'zipCode': instance.zipCode,
    };

Contact _$ContactFromJson(Map<String, dynamic> json) => Contact(
      email: json['email'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'email': instance.email,
      'phone': instance.phone,
    };
