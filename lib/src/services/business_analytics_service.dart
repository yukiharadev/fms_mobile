import 'package:dio/dio.dart';
import 'package:my_app/src/models/tools/analytics/request/business_analytics_request.dart';
import 'package:my_app/src/models/tools/analytics/response/analytics_report_response.dart';
import 'package:my_app/src/utils/constants.dart';

class BusinessAnalyticsService {
  final Dio dio;
  BusinessAnalyticsService({required this.dio});

  Future<List<AnalyticsReportResponse>> getBusinessAnalytics(BusinessAnalyticsRequest request) async {
    final url = "${Constants.businessAnalyticsUrl}symbols=${request.symbols ?? ""}&page=${request.page ?? 1}&per_page=20";

    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final data = response.data;
      final result = data["data"] as List;

      final List<AnalyticsReportResponse> analyticsReports = result.map((e) => AnalyticsReportResponse.fromJson(e as Map<String, dynamic>)).toList();
      return analyticsReports;
    } else {
      throw Exception("Failed to load business analytics data");
    }
  }
}
