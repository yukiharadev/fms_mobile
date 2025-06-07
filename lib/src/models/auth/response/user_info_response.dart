import 'package:json_annotation/json_annotation.dart';

part 'user_info_response.g.dart';

@JsonSerializable()
class UserInfoResponse {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "userId")
  final String userId;
  @JsonKey(name: "fullName")
  final String fullName;
  @JsonKey(name: "avatarUrl")
  final String avatarUrl;
  @JsonKey(name: "birthDate")
  final String birthDay;
  @JsonKey(name: "gender")
  final String gender;

  UserInfoResponse({required this.id, required this.userId, required this.fullName, required this.avatarUrl, required this.birthDay, required this.gender});

  factory UserInfoResponse.fromJson(Map<String, dynamic> json) => _$UserInfoResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserInfoResponseToJson(this);
}
