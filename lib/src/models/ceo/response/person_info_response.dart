import 'package:json_annotation/json_annotation.dart';

part 'person_info_response.g.dart';

@JsonSerializable()
class PersonInfoResponse {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'fullName')
  final String? fullName;
  @JsonKey(name: 'birthDay')
  final String? birthDay;
  @JsonKey(name: 'avatarUrl')
  final String? avatarUrl;
  @JsonKey(name: 'address')
  final String? address;
  @JsonKey(name: 'residence')
  final String? residence;
  @JsonKey(name: 'description')
  final String? description;

  PersonInfoResponse({
    this.id,
    this.fullName,
    this.birthDay,
    this.avatarUrl,
    this.address,
    this.residence,
    this.description,
  });

  factory PersonInfoResponse.fromJson(Map<String, dynamic> json) => _$PersonInfoResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PersonInfoResponseToJson(this);
}
