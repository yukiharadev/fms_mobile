part of 'all_company_bloc.dart';

sealed class AllCompanyState extends Equatable {
  const AllCompanyState();

  @override
  List<Object> get props => [];
}

final class AllCompanyInitial extends AllCompanyState {
  const AllCompanyInitial();
}

final class AllCompanyLoading extends AllCompanyState {
  const AllCompanyLoading();
}

final class AllCompanySuccess extends AllCompanyState {
  final List<PageCompanyResponse> companies;
  const AllCompanySuccess(this.companies);

  @override
  List<Object> get props => [companies];
}

final class AllCompanyFailure extends AllCompanyState {
  final String error;
  const AllCompanyFailure(this.error);

  @override
  List<Object> get props => [error];
}
