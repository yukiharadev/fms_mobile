part of 'market_chart_bloc.dart';

abstract class MarketChartState extends Equatable {
  const MarketChartState();

  @override
  List<Object> get props => [];
}

class MarketChartInitial extends MarketChartState {
  const MarketChartInitial();
}

class MarketChartLoading extends MarketChartState {
  const MarketChartLoading();
}

class MarketChartSuccess extends MarketChartState {
  final MarketChartResponse marketChart;

  const MarketChartSuccess({required this.marketChart});

  @override
  List<Object> get props => [marketChart];
}

class MarketChartError extends MarketChartState {
  final String message;

  const MarketChartError({required this.message});

  @override
  List<Object> get props => [message];
}
