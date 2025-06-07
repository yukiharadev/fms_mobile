import 'package:json_annotation/json_annotation.dart';

part 'work_response.g.dart';

@JsonSerializable()
class WorkResponse {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'fullName')
  final String? fullName;
  @JsonKey(name: 'companies')
  final List<CompanyWorkResponse> companies;

  WorkResponse({
    required this.id,
    this.fullName,
    required this.companies,
  });

  factory WorkResponse.fromJson(Map<String, dynamic> json) => _$WorkResponseFromJson(json);
  Map<String, dynamic> toJson() => _$WorkResponseToJson(this);
}

@JsonSerializable()
class CompanyWorkResponse {
  @JsonKey(name: 'employeeId')
  final String? employeeId;
  @JsonKey(name: 'companyId')
  final String? companyId;
  @JsonKey(name: 'companyName')
  final String? companyName;
  @JsonKey(name: 'symbol')
  final String? symbol;
  @JsonKey(name: 'position')
  final String? position;

  CompanyWorkResponse({
    this.employeeId,
    this.companyId,
    this.companyName,
    this.symbol,
    this.position,
  });

  factory CompanyWorkResponse.fromJson(Map<String, dynamic> json) => _$CompanyWorkResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyWorkResponseToJson(this);
}
