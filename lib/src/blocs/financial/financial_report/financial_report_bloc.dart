import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/src/models/financial/request/financial_report_request.dart';
import 'package:my_app/src/repositories/financial_report_repository.dart';

import '../../../models/financial/response/financial_response.dart';

part 'financial_report_event.dart';
part 'financial_report_state.dart';

class FinancialReportBloc extends Bloc<FinancialReportEvent, FinancialReportState> {
  final FinancialReportRepository repository;
  FinancialReportBloc({required this.repository}) : super(FinancialReportInitial()) {
    on<GetFinancialReport>(_onGetFinancialReport);
  }

  void _onGetFinancialReport(GetFinancialReport event, Emitter<FinancialReportState> emit) async {
    emit(FinancialReportLoading());
    try {
      final response = await repository.getFinancialReport(event.request);
      emit(FinancialReportSuccess(response: response));
    } catch (e) {
      emit(FinancialReportFailure(error: e.toString()));
    }
  }
}
