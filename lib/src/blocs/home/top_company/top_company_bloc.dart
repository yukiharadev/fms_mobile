import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/src/models/home/response/top_company_floor_response.dart';
import '../../../repositories/top_company_repository.dart';

part 'top_company_event.dart';
part 'top_company_state.dart';

class TopCompanyBloc extends Bloc<TopCompanyEvent, TopCompanyState> {
  final TopCompanyRepository topCompanyRepository;
  TopCompanyBloc({required this.topCompanyRepository}) : super(TopCompanyInitial()) {
    on<TopCompanyRequested>(_onTopCompanyRequested);
  }

  Future<void> _onTopCompanyRequested(TopCompanyRequested event, Emitter<TopCompanyState> emit) async {
    emit(TopCompanyLoading(event.centerId));
    try {
      final topCompanyFloorResponse = await topCompanyRepository.getTopCompanyCached(event.centerId);
      emit(TopCompanySuccess(event.centerId, topCompanyFloorResponse));
    } catch (e) {
      emit(TopCompanyError(centerId: event.centerId, message: e.toString()));
    }
  }
}
