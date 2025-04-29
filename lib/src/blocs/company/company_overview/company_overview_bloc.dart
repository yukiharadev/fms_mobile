import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/src/models/company/response/company_overview_response.dart';
import 'package:my_app/src/repositories/company_repository.dart';

part 'company_overview_event.dart';
part 'company_overview_state.dart';

class CompanyOverviewBloc extends Bloc<CompanyOverviewEvent, CompanyOverviewState> {
  final CompanyRepository repository;
  CompanyOverviewBloc({required this.repository}) : super(CompanyOverviewInitial()) {
    on<GetCompanyOverview>(_onGetCompanyOverview);
  }

  Future<void> _onGetCompanyOverview(GetCompanyOverview event, Emitter<CompanyOverviewState> emit) async {
    emit(CompanyOverviewLoading());
    try {
      final response = await repository.getCompanyOverview(event.symbol);
      emit(CompanyOverviewSuccess(response: response));
    } catch (e) {
      emit(CompanyOverviewError(message: e.toString()));
    }
  }
}
