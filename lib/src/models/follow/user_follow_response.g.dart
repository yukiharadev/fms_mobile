// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_follow_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserFollowResponseAdapter extends TypeAdapter<UserFollowResponse> {
  @override
  final int typeId = 1;

  @override
  UserFollowResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserFollowResponse(
      companyName: fields[0] as String,
      symbol: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserFollowResponse obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.companyName)
      ..writeByte(1)
      ..write(obj.symbol);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UserFollowResponseAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserFollowResponse _$UserFollowResponseFromJson(Map<String, dynamic> json) => UserFollowResponse(
      companyName: json['companyName'] as String,
      symbol: json['symbol'] as String,
    );

Map<String, dynamic> _$UserFollowResponseToJson(UserFollowResponse instance) => <String, dynamic>{
      'companyName': instance.companyName,
      'symbol': instance.symbol,
    };
