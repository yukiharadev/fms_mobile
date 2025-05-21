import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'top_company_floor_response.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class TopCompanyFloorResponse {
  @HiveField(0)
  @JsonKey(name: 'symbol')
  final String symbol;

  @HiveField(1)
  @JsonKey(name: 'ceiling_price')
  final double ceilPrice;

  @HiveField(2)
  @JsonKey(name: 'floor_price')
  final double floorPrice;

  @HiveField(3)
  @JsonKey(name: 'accumulated_vol')
  final int volume;
  @HiveField(4)
  @JsonKey(name: 'company_name')
  final String companyName;

  TopCompanyFloorResponse({
    required this.symbol,
    required this.ceilPrice,
    required this.floorPrice,
    required this.volume,
    required this.companyName,
  });

  factory TopCompanyFloorResponse.fromJson(Map<String, dynamic> json) => _$TopCompanyFloorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TopCompanyFloorResponseToJson(this);

  @override
  int get hashCode => Object.hash(symbol, ceilPrice, floorPrice, volume, companyName);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TopCompanyFloorResponse &&
          runtimeType == other.runtimeType &&
          symbol == other.symbol &&
          ceilPrice == other.ceilPrice &&
          floorPrice == other.floorPrice &&
          volume == other.volume &&
          companyName == other.companyName;
}

String generateDataHash(List<TopCompanyFloorResponse> data) {
  return data.map((e) => e.hashCode).join();
}
