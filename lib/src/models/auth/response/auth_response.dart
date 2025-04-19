import 'package:json_annotation/json_annotation.dart';
import 'package:my_app/src/models/auth/response/token_response.dart';
import 'package:my_app/src/models/auth/response/user_response.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse {
  @JsonKey(name: "tokenResponse")
  final TokenResponse? tokenResponse;
  @JsonKey(name: "userData")
  final UserData userData;

  AuthResponse({
    this.tokenResponse,
    required this.userData,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}
