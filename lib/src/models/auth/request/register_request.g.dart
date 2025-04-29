// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) => RegisterRequest(
      fullName: json['fullName'] as String,
      userName: json['userName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      avatarUrl: json['avatarUrl'] as String,
      birthDay: DateTime.parse(json['birthDay'] as String),
    );

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) => <String, dynamic>{
      'fullName': instance.fullName,
      'userName': instance.userName,
      'email': instance.email,
      'password': instance.password,
      'avatarUrl': instance.avatarUrl,
      'birthDay': instance.birthDay.toIso8601String(),
    };
