part of 'company_cash_stock_bloc.dart';

sealed class CompanyCashStockState extends Equatable {
  const CompanyCashStockState();

  @override
  List<Object> get props => [];
}

final class CompanyCashStockInitial extends CompanyCashStockState {
  const CompanyCashStockInitial();
}

final class CompanyCashStockLoading extends CompanyCashStockState {
  const CompanyCashStockLoading();
}

final class CompanyCashStockSuccess extends CompanyCashStockState {
  final ThirdPartyChartResponse response;
  const CompanyCashStockSuccess(this.response);

  @override
  List<Object> get props => [response];
}

final class CompanyCashStockFailure extends CompanyCashStockState {
  final String error;
  const CompanyCashStockFailure(this.error);

  @override
  List<Object> get props => [error];
}
