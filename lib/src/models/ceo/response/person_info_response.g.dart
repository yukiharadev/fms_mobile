// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonInfoResponse _$PersonInfoResponseFromJson(Map<String, dynamic> json) => PersonInfoResponse(
      id: json['id'] as String?,
      fullName: json['fullName'] as String?,
      birthDay: json['birthDay'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      address: json['address'] as String?,
      residence: json['residence'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$PersonInfoResponseToJson(PersonInfoResponse instance) => <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'birthDay': instance.birthDay,
      'avatarUrl': instance.avatarUrl,
      'address': instance.address,
      'residence': instance.residence,
      'description': instance.description,
    };
