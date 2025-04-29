import 'package:json_annotation/json_annotation.dart';

part 'business_analytics_request.g.dart';

@JsonSerializable()
class BusinessAnalyticsRequest {
  @JsonKey(name: "symbols")
  final String? symbols;
  @JsonKey(name: "page")
  final int? page;

  BusinessAnalyticsRequest({
    this.symbols,
    this.page,
  });
  factory BusinessAnalyticsRequest.fromJson(Map<String, dynamic> json) => _$BusinessAnalyticsRequestFromJson(json);
  Map<String, dynamic> toJson() => _$BusinessAnalyticsRequestToJson(this);
}
