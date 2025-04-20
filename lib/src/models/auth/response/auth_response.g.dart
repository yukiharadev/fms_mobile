// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) => AuthResponse(
      tokenResponse: json['tokenResponse'] == null
          ? null
          : TokenResponse.fromJson(
              json['tokenResponse'] as Map<String, dynamic>),
      userData: UserData.fromJson(json['userData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthResponseToJson(AuthResponse instance) =>
    <String, dynamic>{
      'tokenResponse': instance.tokenResponse,
      'userData': instance.userData,
    };
