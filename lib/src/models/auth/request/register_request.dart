import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  @JsonKey(name: 'fullName')
  final String fullName;
  @JsonKey(name: 'userName')
  final String userName;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'password')
  final String password;
  @JsonKey(name: 'avatarUrl')
  final String avatarUrl;
  @JsonKey(name: 'birthDay')
  final DateTime birthDay;

  RegisterRequest({
    required this.fullName,
    required this.userName,
    required this.email,
    required this.password,
    required this.avatarUrl,
    required this.birthDay,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) => _$RegisterRequestFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
