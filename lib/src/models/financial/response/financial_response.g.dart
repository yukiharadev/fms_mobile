// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'financial_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FinancialResponse _$FinancialResponseFromJson(Map<String, dynamic> json) =>
    FinancialResponse(
      headers: json['headers'] == null
          ? null
          : Headers.fromJson(json['headers'] as Map<String, dynamic>),
      financialData: (json['data'] as List<dynamic>?)
          ?.map((e) => FinancialData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FinancialResponseToJson(FinancialResponse instance) =>
    <String, dynamic>{
      'headers': instance.headers,
      'data': instance.financialData,
    };

Headers _$HeadersFromJson(Map<String, dynamic> json) => Headers(
      quarter: (json['quarter'] as num?)?.toInt(),
      year: (json['year'] as num?)?.toInt(),
    );

Map<String, dynamic> _$HeadersToJson(Headers instance) => <String, dynamic>{
      'quarter': instance.quarter,
      'year': instance.year,
    };

FinancialData _$FinancialDataFromJson(Map<String, dynamic> json) =>
    FinancialData(
      categoryName: json['categoryName'] as String,
      value: (json['value'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$FinancialDataToJson(FinancialData instance) =>
    <String, dynamic>{
      'categoryName': instance.categoryName,
      'value': instance.value,
    };
