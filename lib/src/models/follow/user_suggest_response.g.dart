// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_suggest_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserSuggestResponseAdapter extends TypeAdapter<UserSuggestResponse> {
  @override
  final int typeId = 3;

  @override
  UserSuggestResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserSuggestResponse(
      symbol: fields[0] as String,
      companyName: fields[1] as String,
      volume: fields[2] as int,
      analysticCount: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, UserSuggestResponse obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.symbol)
      ..writeByte(1)
      ..write(obj.companyName)
      ..writeByte(2)
      ..write(obj.volume)
      ..writeByte(3)
      ..write(obj.analysticCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UserSuggestResponseAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSuggestResponse _$UserSuggestResponseFromJson(Map<String, dynamic> json) => UserSuggestResponse(
      symbol: json['Symbol'] as String,
      companyName: json['CompanyName'] as String,
      volume: (json['Volume'] as num).toInt(),
      analysticCount: (json['AnalysticCount'] as num).toInt(),
    );

Map<String, dynamic> _$UserSuggestResponseToJson(UserSuggestResponse instance) => <String, dynamic>{
      'Symbol': instance.symbol,
      'CompanyName': instance.companyName,
      'Volume': instance.volume,
      'AnalysticCount': instance.analysticCount,
    };
