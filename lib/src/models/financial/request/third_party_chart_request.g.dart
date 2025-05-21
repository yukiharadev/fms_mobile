// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'third_party_chart_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThirdPartyChartRequest _$ThirdPartyChartRequestFromJson(Map<String, dynamic> json) => ThirdPartyChartRequest(
      symbol: json['symbol'] as String?,
      graphType: (json['graph_type'] as num?)?.toInt(),
      yearReport: (json['year_report'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ThirdPartyChartRequestToJson(ThirdPartyChartRequest instance) => <String, dynamic>{
      'symbol': instance.symbol,
      'graph_type': instance.graphType,
      'year_report': instance.yearReport,
    };
