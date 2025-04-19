// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      id: json['id'] as String,
      userName: json['userName'] as String,
      fullName: json['fullName'] as String,
      avatarUrl: json['avatarUrl'] as String,
      birthDay: json['birthDay'] as String,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'fullName': instance.fullName,
      'avatarUrl': instance.avatarUrl,
      'birthDay': instance.birthDay,
    };
