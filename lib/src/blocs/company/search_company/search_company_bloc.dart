import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/src/models/company/response/company_overview_response.dart';

import '../../../repositories/company_repository.dart';

part 'search_company_event.dart';
part 'search_company_state.dart';

class SearchCompanyBloc extends Bloc<SearchCompanyEvent, SearchCompanyState> {
  final CompanyRepository repository;
  SearchCompanyBloc({required this.repository}) : super(SearchCompanyInitial()) {
    on<SearchCompanyRequest>(_onSearchCompanyRequest);
  }

  Future<void> _onSearchCompanyRequest(SearchCompanyRequest event, Emitter<SearchCompanyState> emit) async {
    emit(SearchCompanyLoading());
    try {
      final response = await repository.searchCompany(event.query);
      emit(SearchCompanySuccess(response: response));
    } catch (e) {
      emit(SearchCompanyError(message: e.toString()));
    }
  }
}
