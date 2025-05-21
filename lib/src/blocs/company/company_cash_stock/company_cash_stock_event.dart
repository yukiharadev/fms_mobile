part of 'company_cash_stock_bloc.dart';

sealed class CompanyCashStockEvent extends Equatable {
  const CompanyCashStockEvent();
}

final class GetCompanyCashStockEvent extends CompanyCashStockEvent {
  final ThirdPartyChartRequest request;
  const GetCompanyCashStockEvent(this.request);

  @override
  List<Object> get props => [request];
}
