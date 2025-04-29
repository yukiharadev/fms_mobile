part of 'company_overview_bloc.dart';

sealed class CompanyOverviewEvent extends Equatable {
  const CompanyOverviewEvent();
}

class GetCompanyOverview extends CompanyOverviewEvent {
  final String symbol;

  const GetCompanyOverview({required this.symbol});

  @override
  List<Object> get props => [symbol];
}
