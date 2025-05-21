import 'package:dio/dio.dart';
import 'package:my_app/src/models/financial/request/third_party_chart_request.dart';
import 'package:my_app/src/models/financial/response/financial_index_response.dart';
import 'package:my_app/src/models/financial/response/third_party_chart_response.dart';
import 'package:my_app/src/utils/constants.dart';

class ThirdPartyService {
  final Dio dio;
  ThirdPartyService({required this.dio});

  Future<FinancialIndexResponse> getFinancialIndex(String symbol) async {
    try {
      final response = await dio.get("${Constants.financialIndexUrl}$symbol");
      if (response.statusCode == 200) {
        return FinancialIndexResponse.fromJson(response.data['data']);
      } else {
        throw Exception("Failed to load financial index data");
      }
    } catch (e) {
      throw Exception("Failed to load financial index data: $e");
    }
  }

  Future<ThirdPartyChartResponse> getThirdPartyChart(ThirdPartyChartRequest request) async {
    try {
      final response = await dio.get(
        "${Constants.financialChartUrl}symbol=${request.symbol}&graph_type=${request.graphType}&year_report=${request.yearReport}",
      );
      if (response.statusCode == 200) {
        return ThirdPartyChartResponse.fromJson(response.data['data']);
      } else {
        throw Exception("Failed to load third party chart data");
      }
    } catch (e) {
      throw Exception("Failed to load third party chart data: $e");
    }
  }
}
