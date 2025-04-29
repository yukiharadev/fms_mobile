import 'package:json_annotation/json_annotation.dart';
part 'financial_report_request.g.dart';

@JsonSerializable()
class FinancialReportRequest {
  @JsonKey(name: 'type')
  final String type;
  @JsonKey(name: 'symbol')
  final String symbol;
  @JsonKey(name: 'quarter')
  final int quarter;
  @JsonKey(name: 'year')
  final int year;

  FinancialReportRequest({
    required this.type,
    required this.symbol,
    required this.quarter,
    required this.year,
  });
  factory FinancialReportRequest.fromJson(Map<String, dynamic> json) => _$FinancialReportRequestFromJson(json);
  Map<String, dynamic> toJson() => _$FinancialReportRequestToJson(this);
}
