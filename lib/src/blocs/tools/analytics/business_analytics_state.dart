part of 'business_analytics_bloc.dart';

sealed class BusinessAnalyticsState extends Equatable {
  const BusinessAnalyticsState();

  @override
  List<Object> get props => [];
}

final class BusinessAnalyticsInitial extends BusinessAnalyticsState {
  const BusinessAnalyticsInitial();
}

final class BusinessAnalyticsLoading extends BusinessAnalyticsState {
  const BusinessAnalyticsLoading();
}

final class BusinessAnalyticsSuccess extends BusinessAnalyticsState {
  final List<AnalyticsReportResponse> businessAnalytics;

  const BusinessAnalyticsSuccess({required this.businessAnalytics});

  @override
  List<Object> get props => [businessAnalytics];
}

final class BusinessAnalyticsError extends BusinessAnalyticsState {
  final String message;

  const BusinessAnalyticsError({required this.message});

  @override
  List<Object> get props => [message];
}
