import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'analytics_report_response.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class AnalyticsReportResponse {
  @HiveField(0)
  @JsonKey(name: 'id')
  final int id;
  @HiveField(1)
  @JsonKey(name: 'title')
  final String title;
  @HiveField(2)
  @JsonKey(name: 'source')
  final String source;
  @HiveField(3)
  @JsonKey(name: 'symbols')
  final String symbols;
  @HiveField(4)
  @JsonKey(name: "summary")
  final String summary;
  @HiveField(5)
  @JsonKey(name: "thumbnail")
  final String? thumbnail;
  @HiveField(6)
  @JsonKey(name: "url_file")
  final String urlFile;
  @HiveField(7)
  @JsonKey(name: "download_count")
  final int downloadCount;
  @HiveField(8)
  @JsonKey(name: "publish_date")
  final String publishDate;

  AnalyticsReportResponse({
    required this.id,
    required this.title,
    required this.source,
    required this.symbols,
    required this.summary,
    this.thumbnail,
    required this.urlFile,
    required this.downloadCount,
    required this.publishDate,
  });
  factory AnalyticsReportResponse.fromJson(Map<String, dynamic> json) => _$AnalyticsReportResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AnalyticsReportResponseToJson(this);

  @override
  int get hashCode => Object.hash(
        id,
        title,
        source,
        symbols,
        summary,
        thumbnail,
        urlFile,
        downloadCount,
        publishDate,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnalyticsReportResponse &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          source == other.source &&
          symbols == other.symbols &&
          summary == other.summary &&
          thumbnail == other.thumbnail &&
          urlFile == other.urlFile &&
          downloadCount == other.downloadCount &&
          publishDate == other.publishDate;
}

String generateAnalyticsHash(List<AnalyticsReportResponse> data) {
  return data.map((e) => e.hashCode).join();
}
