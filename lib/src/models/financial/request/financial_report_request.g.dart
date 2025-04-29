// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'financial_report_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FinancialReportRequest _$FinancialReportRequestFromJson(Map<String, dynamic> json) => FinancialReportRequest(
      type: json['type'] as String,
      symbol: json['symbol'] as String,
      quarter: (json['quarter'] as num).toInt(),
      year: (json['year'] as num).toInt(),
    );

Map<String, dynamic> _$FinancialReportRequestToJson(FinancialReportRequest instance) => <String, dynamic>{
      'type': instance.type,
      'symbol': instance.symbol,
      'quarter': instance.quarter,
      'year': instance.year,
    };
