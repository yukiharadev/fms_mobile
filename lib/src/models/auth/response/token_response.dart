import 'package:json_annotation/json_annotation.dart';
part 'token_response.g.dart';

@JsonSerializable()
class TokenResponse {
  @JsonKey(name: "accessToken")
  final String accessToken;
  @JsonKey(name: "refreshToken")
  final String refreshToken;

  TokenResponse({
    required this.accessToken,
    required this.refreshToken,
  });

  factory TokenResponse.fromJson(Map<String, dynamic> json) => _$TokenResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TokenResponseToJson(this);
}
