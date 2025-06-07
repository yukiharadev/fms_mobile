part of 'person_info_bloc.dart';

sealed class PersonInfoState extends Equatable {
  const PersonInfoState();
}

final class PersonInfoInitial extends PersonInfoState {
  @override
  List<Object> get props => [];
}

final class PersonInfoSuccess extends PersonInfoState {
  final PersonInfoResponse personInfoResponse;

  const PersonInfoSuccess(this.personInfoResponse);

  @override
  List<Object> get props => [personInfoResponse];
}

final class PersonInfoLoading extends PersonInfoState {
  const PersonInfoLoading();

  @override
  List<Object> get props => [];
}

final class PersonInfoError extends PersonInfoState {
  final String message;

  const PersonInfoError({required this.message});

  @override
  List<Object> get props => [message];
}
