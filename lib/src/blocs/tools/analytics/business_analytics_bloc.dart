import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/src/models/tools/analytics/request/business_analytics_request.dart';
import 'package:my_app/src/models/tools/analytics/response/analytics_report_response.dart';
import 'package:my_app/src/repositories/business_analytics_repository.dart';

part 'business_analytics_event.dart';
part 'business_analytics_state.dart';

class BusinessAnalyticsBloc extends Bloc<BusinessAnalyticsEvent, BusinessAnalyticsState> {
  final BusinessAnalyticsRepository repository;

  BusinessAnalyticsBloc({required this.repository}) : super(BusinessAnalyticsInitial()) {
    on<BusinessAnalyticsRequested>(_onBusinessAnalyticsRequested);
  }

  Future<void> _onBusinessAnalyticsRequested(BusinessAnalyticsRequested event, Emitter<BusinessAnalyticsState> emit) async {
    emit(BusinessAnalyticsLoading());
    try {
      final response = await repository.getBusinessAnalyticsCached(event.request);
      emit(BusinessAnalyticsSuccess(businessAnalytics: response));
    } catch (e) {
      emit(BusinessAnalyticsError(message: e.toString()));
    }
  }
}
