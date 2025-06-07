// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkResponse _$WorkResponseFromJson(Map<String, dynamic> json) => WorkResponse(
      id: json['id'] as String,
      fullName: json['fullName'] as String?,
      companies: (json['companies'] as List<dynamic>).map((e) => CompanyWorkResponse.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$WorkResponseToJson(WorkResponse instance) => <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'companies': instance.companies,
    };

CompanyWorkResponse _$CompanyWorkResponseFromJson(Map<String, dynamic> json) => CompanyWorkResponse(
      employeeId: json['employeeId'] as String?,
      companyId: json['companyId'] as String?,
      companyName: json['companyName'] as String?,
      symbol: json['symbol'] as String?,
      position: json['position'] as String?,
    );

Map<String, dynamic> _$CompanyWorkResponseToJson(CompanyWorkResponse instance) => <String, dynamic>{
      'employeeId': instance.employeeId,
      'companyId': instance.companyId,
      'companyName': instance.companyName,
      'symbol': instance.symbol,
      'position': instance.position,
    };
