import 'package:json_annotation/json_annotation.dart';
part 'financial_response.g.dart';

@JsonSerializable()
class FinancialResponse {
  @JsonKey(name: 'headers')
  final List<Headers> headers;
  @JsonKey(name: 'data')
  final List<FinancialData>? financialData;

  FinancialResponse({
    required this.headers,
    this.financialData,
  });
  factory FinancialResponse.fromJson(Map<String, dynamic> json) => _$FinancialResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FinancialResponseToJson(this);
}

@JsonSerializable()
class Headers {
  @JsonKey(name: 'quarter')
  final int? quarter;
  @JsonKey(name: 'year')
  final int? year;

  Headers({
    this.quarter,
    this.year,
  });
  factory Headers.fromJson(Map<String, dynamic> json) => _$HeadersFromJson(json);
  Map<String, dynamic> toJson() => _$HeadersToJson(this);
}

@JsonSerializable()
class FinancialData {
  @JsonKey(name: 'categoryName')
  final String categoryName;
  @JsonKey(name: 'value')
  final List<double> value;

  FinancialData({
    required this.categoryName,
    required this.value,
  });
  factory FinancialData.fromJson(Map<String, dynamic> json) => _$FinancialDataFromJson(json);
  Map<String, dynamic> toJson() => _$FinancialDataToJson(this);
}
