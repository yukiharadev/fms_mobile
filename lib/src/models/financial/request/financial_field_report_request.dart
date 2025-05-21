import 'package:json_annotation/json_annotation.dart';

part 'financial_field_report_request.g.dart';

@JsonSerializable()
class FinancialFieldReportRequest {
  @JsonKey(name: 'type')
  final String type;
  @JsonKey(name: 'symbol')
  final String symbol;
  @JsonKey(name: 'year')
  final int quarter;
  @JsonKey(name: 'widgetType')
  final String widgetType;

  FinancialFieldReportRequest({
    required this.type,
    required this.symbol,
    required this.quarter,
    required this.widgetType,
  });
  factory FinancialFieldReportRequest.fromJson(Map<String, dynamic> json) => _$FinancialFieldReportRequestFromJson(json);
  Map<String, dynamic> toJson() => _$FinancialFieldReportRequestToJson(this);
}
