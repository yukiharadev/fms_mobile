import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/src/models/financial/request/third_party_chart_request.dart';
import 'package:my_app/src/models/financial/response/third_party_chart_response.dart';

import '../../../repositories/third_party_repository.dart';

part 'company_eps_event.dart';
part 'company_eps_state.dart';

class CompanyEpsBloc extends Bloc<CompanyEpsEvent, CompanyEpsState> {
  final ThirdPartyRepository repository;

  CompanyEpsBloc({required this.repository}) : super(CompanyEpsInitial()) {
    on<GetEPSChartEvent>(_onGetEPSChartEvent);
  }

  Future<void> _onGetEPSChartEvent(
    GetEPSChartEvent event,
    Emitter<CompanyEpsState> emit,
  ) async {
    emit(CompanyEpsLoading());
    try {
      final response = await repository.getThirdPartyChart(event.request);
      emit(CompanyEpsSuccess(response));
    } catch (e) {
      emit(CompanyEpsError(e.toString()));
    }
  }
}
