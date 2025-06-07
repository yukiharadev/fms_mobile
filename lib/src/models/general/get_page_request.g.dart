// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_page_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPageRequest _$GetPageRequestFromJson(Map<String, dynamic> json) => GetPageRequest(
      pageIndex: (json['pageIndex'] as num).toInt(),
      pageSize: (json['pageSize'] as num).toInt(),
    );

Map<String, dynamic> _$GetPageRequestToJson(GetPageRequest instance) => <String, dynamic>{
      'pageIndex': instance.pageIndex,
      'pageSize': instance.pageSize,
    };
