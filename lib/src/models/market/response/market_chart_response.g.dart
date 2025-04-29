// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_chart_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketChartResponse _$MarketChartResponseFromJson(Map<String, dynamic> json) => MarketChartResponse(
      symbol: json['ticker'] as String?,
      marketValueResponse: (json['data'] as List<dynamic>?)?.map((e) => MarketValueResponse.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$MarketChartResponseToJson(MarketChartResponse instance) => <String, dynamic>{
      'ticker': instance.symbol,
      'data': instance.marketValueResponse,
    };

MarketValueResponse _$MarketValueResponseFromJson(Map<String, dynamic> json) => MarketValueResponse(
      open: (json['open'] as num).toDouble(),
      high: (json['high'] as num).toDouble(),
      low: (json['low'] as num).toDouble(),
      close: (json['close'] as num).toDouble(),
      volume: (json['volume'] as num).toDouble(),
      tradingDate: json['tradingDate'] as String,
    );

Map<String, dynamic> _$MarketValueResponseToJson(MarketValueResponse instance) => <String, dynamic>{
      'open': instance.open,
      'high': instance.high,
      'low': instance.low,
      'close': instance.close,
      'volume': instance.volume,
      'tradingDate': instance.tradingDate,
    };
