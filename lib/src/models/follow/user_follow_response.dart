import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_follow_response.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class UserFollowResponse {
  @HiveField(0)
  @JsonKey(name: 'companyName')
  final String companyName;
  @HiveField(1)
  @JsonKey(name: 'symbol')
  final String symbol;

  UserFollowResponse({required this.companyName, required this.symbol});

  factory UserFollowResponse.fromJson(Map<String, dynamic> json) => _$UserFollowResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserFollowResponseToJson(this);
}
