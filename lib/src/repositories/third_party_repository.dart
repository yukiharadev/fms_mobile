import 'package:my_app/src/models/financial/response/financial_index_response.dart';

import '../models/financial/request/third_party_chart_request.dart';
import '../models/financial/response/third_party_chart_response.dart';
import '../services/third_party_service.dart';

class ThirdPartyRepository {
  final ThirdPartyService service;

  ThirdPartyRepository({required this.service});

  Future<FinancialIndexResponse> getFinancialIndex(String symbol) async {
    try {
      final response = await service.getFinancialIndex(symbol);
      return response;
    } catch (e) {
      throw Exception("Failed to load financial index data: $e");
    }
  }

  Future<ThirdPartyChartResponse> getThirdPartyChart(ThirdPartyChartRequest request) async {
    try {
      final response = await service.getThirdPartyChart(request);
      return response;
    } catch (e) {
      throw Exception("Failed to load third party chart data: $e");
    }
  }
}
