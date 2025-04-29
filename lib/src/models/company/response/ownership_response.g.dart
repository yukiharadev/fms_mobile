// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ownership_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OwnershipResponseAdapter extends TypeAdapter<OwnershipResponse> {
  @override
  final int typeId = 5;

  @override
  OwnershipResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OwnershipResponse(
      name: fields[0] as String?,
      value: fields[1] as double?,
      stock: fields[2] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, OwnershipResponse obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.value)
      ..writeByte(2)
      ..write(obj.stock);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is OwnershipResponseAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OwnershipResponse _$OwnershipResponseFromJson(Map<String, dynamic> json) => OwnershipResponse(
      name: json['name'] as String?,
      value: (json['value'] as num?)?.toDouble(),
      stock: (json['stock'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$OwnershipResponseToJson(OwnershipResponse instance) => <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
      'stock': instance.stock,
    };
