import 'package:json_annotation/json_annotation.dart';

part 'get_page_request.g.dart';

@JsonSerializable()
class GetPageRequest {
  @JsonKey(name: 'pageIndex')
  final int pageIndex;
  @JsonKey(name: 'pageSize')
  final int pageSize;

  GetPageRequest({
    required this.pageIndex,
    required this.pageSize,
  });

  factory GetPageRequest.fromJson(Map<String, dynamic> json) => _$GetPageRequestFromJson(json);
  Map<String, dynamic> toJson() => _$GetPageRequestToJson(this);
}
