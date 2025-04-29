part of 'market_chart_bloc.dart';

abstract class MarketChartEvent extends Equatable {
  const MarketChartEvent();
}

class MarketChartRequested extends MarketChartEvent {
  final String symbol;

  const MarketChartRequested({required this.symbol});
  @override
  List<Object> get props => [symbol];
}
