// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_report_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnalyticsReportResponseAdapter extends TypeAdapter<AnalyticsReportResponse> {
  @override
  final int typeId = 2;

  @override
  AnalyticsReportResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AnalyticsReportResponse(
      id: fields[0] as int,
      title: fields[1] as String,
      source: fields[2] as String,
      symbols: fields[3] as String,
      summary: fields[4] as String,
      thumbnail: fields[5] as String?,
      urlFile: fields[6] as String,
      downloadCount: fields[7] as int,
      publishDate: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AnalyticsReportResponse obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.source)
      ..writeByte(3)
      ..write(obj.symbols)
      ..writeByte(4)
      ..write(obj.summary)
      ..writeByte(5)
      ..write(obj.thumbnail)
      ..writeByte(6)
      ..write(obj.urlFile)
      ..writeByte(7)
      ..write(obj.downloadCount)
      ..writeByte(8)
      ..write(obj.publishDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AnalyticsReportResponseAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnalyticsReportResponse _$AnalyticsReportResponseFromJson(Map<String, dynamic> json) => AnalyticsReportResponse(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      source: json['source'] as String,
      symbols: json['symbols'] as String,
      summary: json['summary'] as String,
      thumbnail: json['thumbnail'] as String?,
      urlFile: json['url_file'] as String,
      downloadCount: (json['download_count'] as num).toInt(),
      publishDate: json['publish_date'] as String,
    );

Map<String, dynamic> _$AnalyticsReportResponseToJson(AnalyticsReportResponse instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'source': instance.source,
      'symbols': instance.symbols,
      'summary': instance.summary,
      'thumbnail': instance.thumbnail,
      'url_file': instance.urlFile,
      'download_count': instance.downloadCount,
      'publish_date': instance.publishDate,
    };
