import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/src/DependencyInjection/service_locator.dart';
import 'package:my_app/src/blocs/financial/financial_field/financial_field_report_bloc.dart';
import 'package:my_app/src/models/financial/request/financial_field_report_request.dart';
import 'package:my_app/src/repositories/financial_report_repository.dart';
import 'package:my_app/src/widgets/company/financial/business_result_widget.dart';
import 'package:my_app/src/widgets/company/financial/cash_stock_chart_widget.dart';
import 'package:my_app/src/widgets/company/financial/eps_chart_widget.dart';
import 'package:my_app/src/widgets/company/financial/financial_chart_main_indicator_widget.dart';

class CompanyFinanceScreen extends StatelessWidget {
  final String symbol;
  const CompanyFinanceScreen({super.key, required this.symbol});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CashStockChartWidget(symbol: symbol),
            _buildEpsSection(context),
            _buildSection(
              context,
              "main_indicator_result",
              FinancialChartMainIndicatorWidget(symbol: symbol),
              FinancialFieldReportRequest(
                symbol: symbol,
                type: "Tổng tài sản",
                quarter: 4,
                widgetType: "main_indicator_result",
              ),
            ),
            _buildSection(
              context,
              "business_result",
              BusinessResultWidget(symbol: symbol),
              FinancialFieldReportRequest(
                symbol: symbol,
                type: "Tổng lợi nhuận trước thuế",
                quarter: 4,
                widgetType: "business_result",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    String widgetType,
    Widget child,
    FinancialFieldReportRequest initialRequest,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocProvider(
          create: (context) => FinancialFieldReportBloc(
            repository: getIt<FinancialReportRepository>(),
          )..add(GetFinancialFieldReport(request: initialRequest)),
          child: child,
        ),
      ],
    );
  }

  Widget _buildEpsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ESPChartWidget(
          symbol: symbol,
        ),
      ],
    );
  }
}
