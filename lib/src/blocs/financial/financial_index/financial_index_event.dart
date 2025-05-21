part of 'financial_index_bloc.dart';

sealed class FinancialIndexEvent extends Equatable {
  const FinancialIndexEvent();
}

class GetFinancialIndex extends FinancialIndexEvent {
  final String symbol;

  const GetFinancialIndex({required this.symbol});

  @override
  List<Object> get props => [symbol];
}
