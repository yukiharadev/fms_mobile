import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company_overview_response.g.dart';

@HiveType(typeId: 4)
@JsonSerializable()
class CompanyOverviewResponse {
  @HiveField(0)
  @JsonKey(name: "company")
  final CompanyDetailResponse? company;
  @HiveField(1)
  @JsonKey(name: "sector")
  final SectorResponse? sector;

  CompanyOverviewResponse({required this.company, required this.sector});

  factory CompanyOverviewResponse.fromJson(Map<String, dynamic> json) => _$CompanyOverviewResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyOverviewResponseToJson(this);

  @override
  int get hashCode => Object.hash(
        company,
        sector,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is CompanyOverviewResponse && runtimeType == other.runtimeType && company == other.company && sector == other.sector;
}

@JsonSerializable()
class SectorResponse {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "slug")
  final String? slug;

  SectorResponse({required this.id, this.name, this.slug});
  factory SectorResponse.fromJson(Map<String, dynamic> json) => _$SectorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SectorResponseToJson(this);
}

@JsonSerializable()
class CompanyDetailResponse {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "companyName")
  final String? companyName;
  @JsonKey(name: "symbol")
  final String? symbol;
  @JsonKey(name: "logoUrl")
  final String? logoUrl;
  @JsonKey(name: "listedShares")
  final double? listedShares;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "address")
  final String? address;
  @JsonKey(name: "taxCode")
  final String? taxCode;
  @JsonKey(name: "phoneNumber")
  final String? phoneNumber;
  @JsonKey(name: "website")
  final String? website;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "slug")
  final String? slug;

  CompanyDetailResponse({
    // Sửa tên constructor
    required this.id,
    this.companyName,
    this.symbol,
    this.logoUrl,
    this.listedShares,
    this.description,
    this.address,
    this.taxCode,
    this.phoneNumber,
    this.website,
    this.email,
    this.slug,
  });

  factory CompanyDetailResponse.fromJson(Map<String, dynamic> json) => _$CompanyDetailResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyDetailResponseToJson(this);
}

String hashCompanyOverview(CompanyOverviewResponse data) {
  return data.hashCode.toString();
}
