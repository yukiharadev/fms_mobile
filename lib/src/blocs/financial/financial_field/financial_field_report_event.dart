part of 'financial_field_report_bloc.dart';

abstract class FinancialFieldReportEvent extends Equatable {
  const FinancialFieldReportEvent();

  @override
  List<Object?> get props => [];
}

class GetFinancialFieldReport extends FinancialFieldReportEvent {
  final FinancialFieldReportRequest request;

  const GetFinancialFieldReport({required this.request});

  @override
  List<Object?> get props => [request];
}

class GetFinancialBusinessResult extends FinancialFieldReportEvent {
  final FinancialFieldReportRequest request;

  const GetFinancialBusinessResult({required this.request});

  @override
  List<Object?> get props => [request];
}
