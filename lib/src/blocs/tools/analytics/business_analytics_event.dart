part of 'business_analytics_bloc.dart';

sealed class BusinessAnalyticsEvent extends Equatable {
  const BusinessAnalyticsEvent();
}

class BusinessAnalyticsRequested extends BusinessAnalyticsEvent {
  final BusinessAnalyticsRequest request;

  const BusinessAnalyticsRequested({required this.request});

  @override
  List<Object> get props => [request];
}
