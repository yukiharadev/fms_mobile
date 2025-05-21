import 'package:json_annotation/json_annotation.dart';

part 'third_party_chart_response.g.dart';

@JsonSerializable()
class ThirdPartyChartResponse {
  @JsonKey(name: "x-axis")
  final List<XAxis>? xAxis;
  @JsonKey(name: "points")
  final List<Points>? points;

  ThirdPartyChartResponse({
    this.xAxis,
    this.points,
  });
  factory ThirdPartyChartResponse.fromJson(Map<String, dynamic> json) => _$ThirdPartyChartResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ThirdPartyChartResponseToJson(this);
}

@JsonSerializable()
class XAxis {
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'value')
  final int? value;

  XAxis({this.name, this.value});

  factory XAxis.fromJson(Map<String, dynamic> json) => _$XAxisFromJson(json);
  Map<String, dynamic> toJson() => _$XAxisToJson(this);
}

@JsonSerializable()
class Points {
  @JsonKey(name: 'x')
  final int? x;
  @JsonKey(name: 'y')
  final double? y;
  @JsonKey(name: 'y1')
  final double? y1;

  Points({this.x, this.y, this.y1});
  factory Points.fromJson(Map<String, dynamic> json) => _$PointsFromJson(json);
  Map<String, dynamic> toJson() => _$PointsToJson(this);
}
