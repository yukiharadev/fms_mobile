import 'package:json_annotation/json_annotation.dart';

part 'company_leadership_response.g.dart';

@JsonSerializable()
class CompanyLeadershipResponse {
  @JsonKey(name: "department")
  final String department;
  @JsonKey(name: "positions")
  final List<PositionsResponse> positions;

  CompanyLeadershipResponse({
    required this.department,
    required this.positions,
  });

  factory CompanyLeadershipResponse.fromJson(Map<String, dynamic> json) => _$CompanyLeadershipResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyLeadershipResponseToJson(this);
}

@JsonSerializable()
class PositionsResponse {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "employees")
  final List<EmployeeResponse> employees;

  PositionsResponse({
    required this.id,
    required this.name,
    required this.employees,
  });

  factory PositionsResponse.fromJson(Map<String, dynamic> json) => _$PositionsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PositionsResponseToJson(this);
}

@JsonSerializable()
class EmployeeResponse {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "personId")
  final String personId;
  @JsonKey(name: "name")
  final String name;

  EmployeeResponse({
    required this.id,
    required this.personId,
    required this.name,
  });
  factory EmployeeResponse.fromJson(Map<String, dynamic> json) => _$EmployeeResponseFromJson(json);
  Map<String, dynamic> toJson() => _$EmployeeResponseToJson(this);
}
