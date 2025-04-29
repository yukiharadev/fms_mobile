import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/src/models/company/response/ownership_response.dart';

import '../../../repositories/company_repository.dart';

part 'company_ownership_event.dart';
part 'company_ownership_state.dart';

class CompanyOwnershipBloc extends Bloc<CompanyOwnershipEvent, CompanyOwnershipState> {
  final CompanyRepository repository;
  CompanyOwnershipBloc({required this.repository}) : super(CompanyOwnershipInitial()) {
    on<GetCompanyOwnership>(_onGetCompanyOwnership);
  }

  Future<void> _onGetCompanyOwnership(GetCompanyOwnership event, Emitter<CompanyOwnershipState> emit) async {
    emit(CompanyOwnershipLoading());
    try {
      final response = await repository.getOwnership(event.symbol);
      emit(CompanyOwnershipSuccess(response: response));
    } catch (e) {
      emit(CompanyOwnershipError(message: e.toString()));
    }
  }
}
