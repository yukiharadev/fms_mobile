import 'package:dio/dio.dart';
import 'package:my_app/src/utils/constants.dart';

class MarketChartService {
  final Dio dio;

  MarketChartService({required this.dio});

  Future<Response> getMarketChart(String symbol) async {
    final response = await dio.get('${Constants.marketChartUrl}$symbol&type=stock&resolution=D&to=${DateTime.now().millisecondsSinceEpoch ~/ 1000}&countBack=365');
    return response;
  }
}
