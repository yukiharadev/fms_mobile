part of 'get_work_bloc.dart';

sealed class GetWorkEvent extends Equatable {
  const GetWorkEvent();
}

final class GetWorkLoadEvent extends GetWorkEvent {
  final String personId;

  const GetWorkLoadEvent({required this.personId});

  @override
  List<Object> get props => [personId];
}
