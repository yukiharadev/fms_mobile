part of 'company_eps_bloc.dart';

sealed class CompanyEpsState extends Equatable {
  const CompanyEpsState();

  @override
  List<Object> get props => [];
}

final class CompanyEpsInitial extends CompanyEpsState {
  const CompanyEpsInitial();
}

final class CompanyEpsLoading extends CompanyEpsState {
  const CompanyEpsLoading();
}

final class CompanyEpsSuccess extends CompanyEpsState {
  final ThirdPartyChartResponse response;
  const CompanyEpsSuccess(this.response);

  @override
  List<Object> get props => [response];
}

final class CompanyEpsError extends CompanyEpsState {
  final String message;
  const CompanyEpsError(this.message);

  @override
  List<Object> get props => [message];
}
