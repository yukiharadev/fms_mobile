import 'package:json_annotation/json_annotation.dart';
part 'third_party_chart_request.g.dart';

@JsonSerializable()
class ThirdPartyChartRequest {
  @JsonKey(name: 'symbol')
  final String? symbol;
  @JsonKey(name: 'graph_type')
  final int? graphType;
  @JsonKey(name: 'year_report')
  final int? yearReport;

  ThirdPartyChartRequest({
    this.symbol,
    this.graphType,
    this.yearReport,
  });

  factory ThirdPartyChartRequest.fromJson(Map<String, dynamic> json) => _$ThirdPartyChartRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ThirdPartyChartRequestToJson(this);
}
