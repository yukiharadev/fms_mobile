import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_suggest_response.g.dart';

@HiveType(typeId: 3)
@JsonSerializable()
class UserSuggestResponse {
  @HiveField(0)
  @JsonKey(name: "Symbol")
  final String symbol;
  @HiveField(1)
  @JsonKey(name: "CompanyName")
  final String companyName;
  @HiveField(2)
  @JsonKey(name: "Volume")
  final int volume;
  @HiveField(3)
  @JsonKey(name: "AnalysticCount")
  final int analysticCount;

  UserSuggestResponse({
    required this.symbol,
    required this.companyName,
    required this.volume,
    required this.analysticCount,
  });

  factory UserSuggestResponse.fromJson(Map<String, dynamic> json) => _$UserSuggestResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserSuggestResponseToJson(this);
}
