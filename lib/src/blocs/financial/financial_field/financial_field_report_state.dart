part of 'financial_field_report_bloc.dart';

abstract class FinancialFieldReportState extends Equatable {
  const FinancialFieldReportState();

  @override
  List<Object?> get props => [];
}

class FinancialFieldReportInitial extends FinancialFieldReportState {
  const FinancialFieldReportInitial();
}

class FinancialFieldReportLoading extends FinancialFieldReportState {
  final String widgetType;

  const FinancialFieldReportLoading({required this.widgetType});

  @override
  List<Object?> get props => [widgetType];
}

class FinancialFieldReportSuccess extends FinancialFieldReportState {
  final String widgetType;
  final FinancialResponse responses;

  const FinancialFieldReportSuccess({
    required this.widgetType,
    required this.responses,
  });

  @override
  List<Object?> get props => [widgetType, responses];
}

class FinancialFieldReportFailure extends FinancialFieldReportState {
  final String widgetType;
  final String error;
  final String? stackTrace; // Added for better debugging

  const FinancialFieldReportFailure({
    required this.widgetType,
    required this.error,
    this.stackTrace,
  });

  @override
  List<Object?> get props => [widgetType, error, stackTrace];
}
