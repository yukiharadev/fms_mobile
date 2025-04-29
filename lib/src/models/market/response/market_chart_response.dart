import 'package:json_annotation/json_annotation.dart';
part 'market_chart_response.g.dart';

@JsonSerializable()
class MarketChartResponse {
  @JsonKey(name: "ticker")
  final String? symbol;
  @JsonKey(name: "data")
  final List<MarketValueResponse>? marketValueResponse;

  MarketChartResponse({this.symbol, this.marketValueResponse});
  factory MarketChartResponse.fromJson(Map<String, dynamic> json) => _$MarketChartResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MarketChartResponseToJson(this);
}

@JsonSerializable()
class MarketValueResponse {
  @JsonKey(name: "open")
  final double open;
  @JsonKey(name: "high")
  final double high;
  @JsonKey(name: "low")
  final double low;
  @JsonKey(name: "close")
  final double close;
  @JsonKey(name: "volume")
  final double volume;
  @JsonKey(name: "tradingDate")
  final String tradingDate;

  MarketValueResponse({required this.open, required this.high, required this.low, required this.close, required this.volume, required this.tradingDate});

  factory MarketValueResponse.fromJson(Map<String, dynamic> json) => _$MarketValueResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MarketValueResponseToJson(this);
}
