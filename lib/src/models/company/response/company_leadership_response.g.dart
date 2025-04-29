// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_leadership_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyLeadershipResponse _$CompanyLeadershipResponseFromJson(Map<String, dynamic> json) => CompanyLeadershipResponse(
      department: json['department'] as String,
      positions: (json['positions'] as List<dynamic>).map((e) => PositionsResponse.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$CompanyLeadershipResponseToJson(CompanyLeadershipResponse instance) => <String, dynamic>{
      'department': instance.department,
      'positions': instance.positions,
    };

PositionsResponse _$PositionsResponseFromJson(Map<String, dynamic> json) => PositionsResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      employees: (json['employees'] as List<dynamic>).map((e) => EmployeeResponse.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$PositionsResponseToJson(PositionsResponse instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'employees': instance.employees,
    };

EmployeeResponse _$EmployeeResponseFromJson(Map<String, dynamic> json) => EmployeeResponse(
      id: json['id'] as String,
      personId: json['personId'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$EmployeeResponseToJson(EmployeeResponse instance) => <String, dynamic>{
      'id': instance.id,
      'personId': instance.personId,
      'name': instance.name,
    };
