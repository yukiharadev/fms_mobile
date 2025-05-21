part of 'search_company_bloc.dart';

sealed class SearchCompanyEvent extends Equatable {
  const SearchCompanyEvent();
}

final class SearchCompanyRequest extends SearchCompanyEvent {
  final String query;

  const SearchCompanyRequest({required this.query});

  @override
  List<Object> get props => [query];
}
