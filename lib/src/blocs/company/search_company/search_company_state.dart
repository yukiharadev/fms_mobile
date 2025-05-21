part of 'search_company_bloc.dart';

sealed class SearchCompanyState extends Equatable {
  const SearchCompanyState();

  @override
  List<Object> get props => [];
}

final class SearchCompanyInitial extends SearchCompanyState {
  const SearchCompanyInitial();
}

final class SearchCompanyLoading extends SearchCompanyState {
  const SearchCompanyLoading();
}

final class SearchCompanySuccess extends SearchCompanyState {
  final List<CompanyDetailResponse> response;
  const SearchCompanySuccess({required this.response});

  @override
  List<Object> get props => [response];
}

final class SearchCompanyError extends SearchCompanyState {
  final String message;
  const SearchCompanyError({required this.message});

  @override
  List<Object> get props => [message];
}
