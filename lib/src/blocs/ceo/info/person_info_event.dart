part of 'person_info_bloc.dart';

sealed class PersonInfoEvent extends Equatable {
  const PersonInfoEvent();
}

final class PersonInfoLoadEvent extends PersonInfoEvent {
  final String personId;

  const PersonInfoLoadEvent(this.personId);

  @override
  List<Object> get props => [personId];
}
