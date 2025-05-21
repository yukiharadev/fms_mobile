import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/src/repositories/third_party_repository.dart';

import '../../../models/financial/request/third_party_chart_request.dart';
import '../../../models/financial/response/third_party_chart_response.dart';

part 'company_cash_stock_event.dart';
part 'company_cash_stock_state.dart';

class CompanyCashStockBloc extends Bloc<CompanyCashStockEvent, CompanyCashStockState> {
  final ThirdPartyRepository repository;
  CompanyCashStockBloc({required this.repository}) : super(CompanyCashStockInitial()) {
    on<GetCompanyCashStockEvent>(_onGetCompanyCashStockEvent);
  }

  void _onGetCompanyCashStockEvent(
    GetCompanyCashStockEvent event,
    Emitter<CompanyCashStockState> emit,
  ) async {
    emit(const CompanyCashStockLoading());
    try {
      final response = await repository.getThirdPartyChart(event.request);
      emit(CompanyCashStockSuccess(response));
    } catch (e) {
      emit(CompanyCashStockFailure(e.toString()));
    }
  }
}
