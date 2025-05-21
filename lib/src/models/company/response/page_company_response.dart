import 'package:json_annotation/json_annotation.dart';

part 'page_company_response.g.dart';

@JsonSerializable()
class PageCompanyResponse {
  @JsonKey(name: 'symbol')
  final String symbol;
  @JsonKey(name: 'companyName')
  final String companyName;

  PageCompanyResponse({
    required this.symbol,
    required this.companyName,
  });
  factory PageCompanyResponse.fromJson(Map<String, dynamic> json) => _$PageCompanyResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PageCompanyResponseToJson(this);
}
