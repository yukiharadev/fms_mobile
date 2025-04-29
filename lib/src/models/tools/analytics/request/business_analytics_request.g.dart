// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_analytics_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessAnalyticsRequest _$BusinessAnalyticsRequestFromJson(Map<String, dynamic> json) => BusinessAnalyticsRequest(
      symbols: json['symbols'] as String?,
      page: (json['page'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BusinessAnalyticsRequestToJson(BusinessAnalyticsRequest instance) => <String, dynamic>{
      'symbols': instance.symbols,
      'page': instance.page,
    };
