import 'package:my_app/src/models/market/response/market_chart_response.dart';

import '../services/market_chart_service.dart';

class MarketChartRepository {
  final MarketChartService marketChartService;

  MarketChartRepository({required this.marketChartService});

  Future<MarketChartResponse> getMarketChart(String symbol) async {
    try {
      final response = await marketChartService.getMarketChart(symbol);
      if (response.statusCode != 200) {
        throw Exception('Failed to load market chart: ${response.statusMessage}');
      }
      return MarketChartResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load market chart: $e');
    }
  }
}
