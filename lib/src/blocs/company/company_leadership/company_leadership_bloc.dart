import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/src/repositories/company_repository.dart';
import '../../../models/company/response/company_leadership_response.dart';

part 'company_leadership_event.dart';
part 'company_leadership_state.dart';

class CompanyLeadershipBloc extends Bloc<CompanyLeadershipEvent, CompanyLeadershipState> {
  final CompanyRepository repository;
  CompanyLeadershipBloc({required this.repository}) : super(CompanyLeadershipInitial()) {
    on<GetCompanyLeadership>(_onGetCompanyLeadership);
  }

  Future<void> _onGetCompanyLeadership(GetCompanyLeadership event, Emitter<CompanyLeadershipState> emit) async {
    emit(CompanyLeadershipLoading());
    try {
      final response = await repository.getCompanyLeadership(event.companyId);
      emit(CompanyLeadershipSuccess(response: response));
    } catch (e) {
      emit(CompanyLeadershipError(error: e.toString()));
    }
  }
}
