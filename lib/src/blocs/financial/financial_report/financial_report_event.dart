part of 'financial_report_bloc.dart';

sealed class FinancialReportEvent extends Equatable {
  const FinancialReportEvent();
}

class GetFinancialReport extends FinancialReportEvent {
  final FinancialReportRequest request;

  const GetFinancialReport({required this.request});
  @override
  List<Object> get props => [request];
}
