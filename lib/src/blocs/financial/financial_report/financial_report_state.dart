part of 'financial_report_bloc.dart';

sealed class FinancialReportState extends Equatable {
  const FinancialReportState();

  @override
  List<Object> get props => [];
}

final class FinancialReportInitial extends FinancialReportState {
  const FinancialReportInitial();
}

final class FinancialReportLoading extends FinancialReportState {
  const FinancialReportLoading();
}

final class FinancialReportSuccess extends FinancialReportState {
  final FinancialResponse response;

  const FinancialReportSuccess({required this.response});

  @override
  List<Object> get props => [response];
}

final class FinancialReportFailure extends FinancialReportState {
  final String error;

  const FinancialReportFailure({required this.error});

  @override
  List<Object> get props => [error];
}
