import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/src/models/ceo/response/person_info_response.dart';
import 'package:my_app/src/repositories/person_repository.dart';

part 'person_info_event.dart';
part 'person_info_state.dart';

class PersonInfoBloc extends Bloc<PersonInfoEvent, PersonInfoState> {
  final PersonRepository repository;

  PersonInfoBloc({required this.repository}) : super(PersonInfoInitial()) {
    on<PersonInfoLoadEvent>(_onLoadPersonInfo);
  }

  Future<void> _onLoadPersonInfo(PersonInfoLoadEvent event, Emitter<PersonInfoState> emit) async {
    emit(PersonInfoLoading());
    try {
      final personInfoResponse = await repository.getPersonInfo(event.personId);
      emit(PersonInfoSuccess(personInfoResponse));
    } catch (e) {
      emit(PersonInfoError(message: e.toString()));
    }
  }
}
