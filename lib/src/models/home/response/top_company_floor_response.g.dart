// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_company_floor_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TopCompanyFloorResponseAdapter extends TypeAdapter<TopCompanyFloorResponse> {
  @override
  final int typeId = 0;

  @override
  TopCompanyFloorResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TopCompanyFloorResponse(
      symbol: fields[0] as String,
      ceilPrice: fields[1] as double,
      floorPrice: fields[2] as double,
      volume: fields[3] as int,
      companyName: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TopCompanyFloorResponse obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.symbol)
      ..writeByte(1)
      ..write(obj.ceilPrice)
      ..writeByte(2)
      ..write(obj.floorPrice)
      ..writeByte(3)
      ..write(obj.volume)
      ..writeByte(4)
      ..write(obj.companyName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TopCompanyFloorResponseAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopCompanyFloorResponse _$TopCompanyFloorResponseFromJson(Map<String, dynamic> json) => TopCompanyFloorResponse(
      symbol: json['Symbol'] as String,
      ceilPrice: (json['CeilPrice'] as num).toDouble(),
      floorPrice: (json['FloorPrice'] as num).toDouble(),
      volume: (json['Volume'] as num).toInt(),
      companyName: json['CompanyName'] as String,
    );

Map<String, dynamic> _$TopCompanyFloorResponseToJson(TopCompanyFloorResponse instance) => <String, dynamic>{
      'Symbol': instance.symbol,
      'CeilPrice': instance.ceilPrice,
      'FloorPrice': instance.floorPrice,
      'Volume': instance.volume,
      'CompanyName': instance.companyName,
    };
