part of 'company_overview_bloc.dart';

abstract class CompanyOverviewState extends Equatable {
  const CompanyOverviewState();
  @override
  List<Object> get props => [];
}

final class CompanyOverviewInitial extends CompanyOverviewState {
  const CompanyOverviewInitial();
}

class CompanyOverviewLoading extends CompanyOverviewState {
  const CompanyOverviewLoading();
}

class CompanyOverviewSuccess extends CompanyOverviewState {
  final CompanyOverviewResponse response;
  const CompanyOverviewSuccess({required this.response});

  @override
  List<Object> get props => [response];
}

class CompanyOverviewError extends CompanyOverviewState {
  final String message;
  const CompanyOverviewError({required this.message});

  @override
  List<Object> get props => [message];
}
