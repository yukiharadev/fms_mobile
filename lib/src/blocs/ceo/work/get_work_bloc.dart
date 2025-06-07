import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/src/repositories/person_repository.dart';

import '../../../models/ceo/response/work_response.dart';

part 'get_work_event.dart';
part 'get_work_state.dart';

class GetWorkBloc extends Bloc<GetWorkEvent, GetWorkState> {
  final PersonRepository repository;
  GetWorkBloc({required this.repository}) : super(GetWorkInitial()) {
    on<GetWorkLoadEvent>(_onLoadWork);
  }
  Future<void> _onLoadWork(GetWorkLoadEvent event, Emitter<GetWorkState> emit) async {
    emit(GetWorkLoading());
    try {
      final workResponse = await repository.getWorkInfo(event.personId);
      emit(GetWorkSuccess(workResponse));
    } catch (e) {
      emit(GetWorkError(message: e.toString()));
    }
  }
}
