part of 'company_eps_bloc.dart';

sealed class CompanyEpsEvent extends Equatable {
  const CompanyEpsEvent();
}

final class GetEPSChartEvent extends CompanyEpsEvent {
  final ThirdPartyChartRequest request;
  const GetEPSChartEvent(this.request);

  @override
  List<Object> get props => [request];
}
