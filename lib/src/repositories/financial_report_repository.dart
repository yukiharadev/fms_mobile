import 'package:my_app/src/services/financial_report_service.dart';

import '../models/financial/request/financial_report_request.dart';
import '../models/financial/response/financial_response.dart';

class FinancialReportRepository {
  final FinancialReportService service;
  FinancialReportRepository({required this.service});

  Future<FinancialResponse> getFinancialReport(FinancialReportRequest request) async {
    try {
      final response = await service.getFinancialReport(request);
      return response;
    } catch (e) {
      throw Exception("Failed to load financial report data: $e");
    }
  }
}
