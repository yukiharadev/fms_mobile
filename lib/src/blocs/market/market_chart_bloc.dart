import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/src/models/market/response/market_chart_response.dart';
import 'package:my_app/src/repositories/market_chart_repository.dart';

part 'market_chart_event.dart';
part 'market_chart_state.dart';

class MarketChartBloc extends Bloc<MarketChartEvent, MarketChartState> {
  final MarketChartRepository marketChartRepository;

  MarketChartBloc({required this.marketChartRepository}) : super(MarketChartInitial()) {
    on<MarketChartRequested>(_onMarketChartRequested);
  }

  FutureOr<void> _onMarketChartRequested(MarketChartRequested event, Emitter<MarketChartState> emit) async {
    emit(MarketChartLoading());
    try {
      final response = await marketChartRepository.getMarketChart(event.symbol);
      emit(MarketChartSuccess(marketChart: response));
    } catch (e) {
      emit(MarketChartError(message: e.toString()));
    }
  }
}
