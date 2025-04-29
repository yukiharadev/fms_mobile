part of 'company_leadership_bloc.dart';

sealed class CompanyLeadershipState extends Equatable {
  const CompanyLeadershipState();

  @override
  List<Object> get props => [];
}

final class CompanyLeadershipInitial extends CompanyLeadershipState {
  const CompanyLeadershipInitial();
}

final class CompanyLeadershipLoading extends CompanyLeadershipState {
  const CompanyLeadershipLoading();
}

final class CompanyLeadershipSuccess extends CompanyLeadershipState {
  final List<CompanyLeadershipResponse> response;

  const CompanyLeadershipSuccess({required this.response});

  @override
  List<Object> get props => [response];
}

final class CompanyLeadershipError extends CompanyLeadershipState {
  final String error;

  const CompanyLeadershipError({required this.error});

  @override
  List<Object> get props => [error];
}
