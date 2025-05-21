import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/src/models/company/response/page_company_response.dart';

import '../../../models/general/get_page_request.dart';
import '../../../repositories/company_repository.dart';

part 'all_company_event.dart';
part 'all_company_state.dart';

class AllCompanyBloc extends Bloc<AllCompanyEvent, AllCompanyState> {
  final CompanyRepository repository;
  AllCompanyBloc({required this.repository}) : super(AllCompanyInitial()) {
    on<AllCompanyLoadEvent>(_onLoadAllCompany);
  }

  Future<void> _onLoadAllCompany(AllCompanyLoadEvent event, Emitter<AllCompanyState> emit) async {
    emit(AllCompanyLoading());
    try {
      final response = await repository.getPageSizeCompany(event.request);
      emit(AllCompanySuccess(response));
    } catch (e) {
      emit(AllCompanyFailure(e.toString()));
    }
  }
}
