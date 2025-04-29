// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_overview_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CompanyOverviewResponseAdapter extends TypeAdapter<CompanyOverviewResponse> {
  @override
  final int typeId = 4;

  @override
  CompanyOverviewResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CompanyOverviewResponse(
      company: fields[0] as CompanyDetailResponse?,
      sector: fields[1] as SectorResponse?,
    );
  }

  @override
  void write(BinaryWriter writer, CompanyOverviewResponse obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.company)
      ..writeByte(1)
      ..write(obj.sector);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CompanyOverviewResponseAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyOverviewResponse _$CompanyOverviewResponseFromJson(Map<String, dynamic> json) => CompanyOverviewResponse(
      company: json['company'] == null ? null : CompanyDetailResponse.fromJson(json['company'] as Map<String, dynamic>),
      sector: json['sector'] == null ? null : SectorResponse.fromJson(json['sector'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CompanyOverviewResponseToJson(CompanyOverviewResponse instance) => <String, dynamic>{
      'company': instance.company,
      'sector': instance.sector,
    };

SectorResponse _$SectorResponseFromJson(Map<String, dynamic> json) => SectorResponse(
      id: json['id'] as String,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
    );

Map<String, dynamic> _$SectorResponseToJson(SectorResponse instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
    };

CompanyDetailResponse _$CompanyDetailResponseFromJson(Map<String, dynamic> json) => CompanyDetailResponse(
      id: json['id'] as String,
      companyName: json['companyName'] as String?,
      symbol: json['symbol'] as String?,
      logoUrl: json['logoUrl'] as String?,
      listedShares: (json['listedShares'] as num?)?.toDouble(),
      description: json['description'] as String?,
      address: json['address'] as String?,
      taxCode: json['taxCode'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      website: json['website'] as String?,
      email: json['email'] as String?,
      slug: json['slug'] as String?,
    );

Map<String, dynamic> _$CompanyDetailResponseToJson(CompanyDetailResponse instance) => <String, dynamic>{
      'id': instance.id,
      'companyName': instance.companyName,
      'symbol': instance.symbol,
      'logoUrl': instance.logoUrl,
      'listedShares': instance.listedShares,
      'description': instance.description,
      'address': instance.address,
      'taxCode': instance.taxCode,
      'phoneNumber': instance.phoneNumber,
      'website': instance.website,
      'email': instance.email,
      'slug': instance.slug,
    };
