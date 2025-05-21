part of 'financial_index_bloc.dart';

sealed class FinancialIndexState extends Equatable {
  const FinancialIndexState();

  @override
  List<Object> get props => [];
}

final class FinancialIndexInitial extends FinancialIndexState {
  const FinancialIndexInitial();
}

final class FinancialIndexLoading extends FinancialIndexState {
  const FinancialIndexLoading();
}

final class FinancialIndexSuccess extends FinancialIndexState {
  final FinancialIndexResponse response;

  const FinancialIndexSuccess({required this.response});

  @override
  List<Object> get props => [response];
}

final class FinancialIndexFailure extends FinancialIndexState {
  final String error;

  const FinancialIndexFailure({required this.error});

  @override
  List<Object> get props => [error];
}
