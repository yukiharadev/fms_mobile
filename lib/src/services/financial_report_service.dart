import 'package:my_app/src/models/financial/request/financial_report_request.dart';
import 'package:my_app/src/models/financial/response/financial_response.dart';
import 'package:my_app/src/services/dio_client.dart';
import 'package:my_app/src/utils/constants.dart';

class FinancialReportService {
  final DioClient dioClient;

  FinancialReportService({required this.dioClient});

  Future<FinancialResponse> getFinancialReport(FinancialReportRequest request) async {
    final response =
        await dioClient.dio.get("${Constants.financialReportUrl}finance-reports/${request.type}?symbol=${request.symbol}&quarter=${request.quarter}&year=${request.year}");
    if (response.statusCode == 200) {
      return FinancialResponse.fromJson(response.data['value']);
    } else {
      throw Exception("Failed to load financial report data");
    }
  }
}
