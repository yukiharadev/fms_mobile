// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'third_party_chart_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThirdPartyChartResponse _$ThirdPartyChartResponseFromJson(Map<String, dynamic> json) => ThirdPartyChartResponse(
      xAxis: (json['x-axis'] as List<dynamic>?)?.map((e) => XAxis.fromJson(e as Map<String, dynamic>)).toList(),
      points: (json['points'] as List<dynamic>?)?.map((e) => Points.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$ThirdPartyChartResponseToJson(ThirdPartyChartResponse instance) => <String, dynamic>{
      'x-axis': instance.xAxis,
      'points': instance.points,
    };

XAxis _$XAxisFromJson(Map<String, dynamic> json) => XAxis(
      name: json['name'] as String?,
      value: (json['value'] as num?)?.toInt(),
    );

Map<String, dynamic> _$XAxisToJson(XAxis instance) => <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };

Points _$PointsFromJson(Map<String, dynamic> json) => Points(
      x: (json['x'] as num?)?.toInt(),
      y: (json['y'] as num?)?.toDouble(),
      y1: (json['y1'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PointsToJson(Points instance) => <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'y1': instance.y1,
    };
