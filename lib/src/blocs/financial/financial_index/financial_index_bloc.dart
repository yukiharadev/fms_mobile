import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/src/models/financial/response/financial_index_response.dart';
import 'package:my_app/src/repositories/third_party_repository.dart';

part 'financial_index_event.dart';
part 'financial_index_state.dart';

class FinancialIndexBloc extends Bloc<FinancialIndexEvent, FinancialIndexState> {
  final ThirdPartyRepository repository;

  FinancialIndexBloc({required this.repository}) : super(FinancialIndexInitial()) {
    on<GetFinancialIndex>(_onGetFinancialIndex);
  }

  void _onGetFinancialIndex(GetFinancialIndex event, Emitter<FinancialIndexState> emit) async {
    emit(FinancialIndexLoading());
    try {
      final response = await repository.getFinancialIndex(event.symbol);
      emit(FinancialIndexSuccess(response: response));
    } catch (e) {
      emit(FinancialIndexFailure(error: e.toString()));
    }
  }
}
