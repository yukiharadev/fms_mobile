import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ownership_response.g.dart';

@HiveType(typeId: 5)
@JsonSerializable()
class OwnershipResponse {
  @HiveField(0)
  @JsonKey(name: "name")
  final String? name;
  @HiveField(1)
  @JsonKey(name: "value")
  final double? value;
  @HiveField(2)
  @JsonKey(name: "stock")
  final double? stock;

  OwnershipResponse({
    this.name,
    this.value,
    this.stock,
  });

  factory OwnershipResponse.fromJson(Map<String, dynamic> json) => _$OwnershipResponseFromJson(json);
  Map<String, dynamic> toJson() => _$OwnershipResponseToJson(this);
}
