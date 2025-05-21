// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'financial_field_report_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FinancialFieldReportRequest _$FinancialFieldReportRequestFromJson(Map<String, dynamic> json) => FinancialFieldReportRequest(
      type: json['type'] as String,
      symbol: json['symbol'] as String,
      quarter: (json['year'] as num).toInt(),
      widgetType: json['widgetType'] as String,
    );

Map<String, dynamic> _$FinancialFieldReportRequestToJson(FinancialFieldReportRequest instance) => <String, dynamic>{
      'type': instance.type,
      'symbol': instance.symbol,
      'year': instance.quarter,
      'widgetType': instance.widgetType,
    };
