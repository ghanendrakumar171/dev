// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getEmployeesDataResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeesDataResponseModel _$EmployeesDataResponseModelFromJson(
        Map<String, dynamic> json) =>
    EmployeesDataResponseModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: json['page'] == null
          ? null
          : Page.fromJson(json['page'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EmployeesDataResponseModelToJson(
        EmployeesDataResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'page': instance.page,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      emp_id: json['_id'] as String?,
      name: json['name'] as String?,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      contact: json['contact'] == null
          ? null
          : Contact.fromJson(json['contact'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'emp_id': instance.emp_id,
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

Page _$PageFromJson(Map<String, dynamic> json) => Page(
      total: (json['total'] as num?)?.toInt(),
      nextOffset: (json['nextOffset'] as num?)?.toInt(),
      previousOffset: (json['previousOffset'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PageToJson(Page instance) => <String, dynamic>{
      'total': instance.total,
      'nextOffset': instance.nextOffset,
      'previousOffset': instance.previousOffset,
      'limit': instance.limit,
    };
