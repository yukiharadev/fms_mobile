import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserData {
  final String id;
  final String userName;
  final String fullName;
  final String avatarUrl;
  final String birthDay;

  UserData({
    required this.id,
    required this.userName,
    required this.fullName,
    required this.avatarUrl,
    required this.birthDay,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
