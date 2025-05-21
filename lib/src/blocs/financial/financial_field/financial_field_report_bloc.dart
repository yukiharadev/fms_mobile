import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/src/models/financial/request/financial_field_report_request.dart';
import 'package:my_app/src/models/financial/response/financial_response.dart';
import 'package:my_app/src/repositories/financial_report_repository.dart';
import 'package:talker/talker.dart';

part 'financial_field_report_event.dart';
part 'financial_field_report_state.dart';

class FinancialFieldReportBloc extends Bloc<FinancialFieldReportEvent, FinancialFieldReportState> {
  final FinancialReportRepository repository;
  final Talker talker = Talker(); // Added for logging

  FinancialFieldReportBloc({required this.repository}) : super(const FinancialFieldReportInitial()) {
    on<GetFinancialFieldReport>(_onGetFinancialFieldReport);
    on<GetFinancialBusinessResult>(_onGetFinancialFieldReport); // Simplified registration
  }

  Future<void> _onGetFinancialFieldReport(
    FinancialFieldReportEvent event,
    Emitter<FinancialFieldReportState> emit,
  ) async {
    // Ensure the event is of the correct type and extract the request
    if (event is! GetFinancialFieldReport && event is! GetFinancialBusinessResult) {
      talker.error('Invalid event type: ${event.runtimeType}');
      return;
    }

    final request = event is GetFinancialFieldReport ? event.request : (event as GetFinancialBusinessResult).request;

    talker.info('Processing event for widgetType: ${request.widgetType}, symbol: ${request.symbol}, type: ${request.type}');
    emit(FinancialFieldReportLoading(widgetType: request.widgetType));

    try {
      final response = await repository.getFinancialFieldReport(request);
      talker.info('Successfully fetched data for widgetType: ${request.widgetType}');
      emit(FinancialFieldReportSuccess(widgetType: request.widgetType, responses: response));
    } catch (e, stackTrace) {
      talker.error('Error fetching data for widgetType: ${request.widgetType}', e, stackTrace);
      emit(FinancialFieldReportFailure(
        widgetType: request.widgetType,
        error: e.toString(),
        stackTrace: stackTrace.toString(), // Include stack trace for debugging
      ));
    }
  }
}
