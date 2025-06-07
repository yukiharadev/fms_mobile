part of 'get_work_bloc.dart';

sealed class GetWorkState extends Equatable {
  const GetWorkState();
}

final class GetWorkInitial extends GetWorkState {
  @override
  List<Object> get props => [];
}

final class GetWorkLoading extends GetWorkState {
  @override
  List<Object> get props => [];
}

final class GetWorkSuccess extends GetWorkState {
  final WorkResponse workResponse;

  const GetWorkSuccess(this.workResponse);

  @override
  List<Object> get props => [workResponse];
}

final class GetWorkError extends GetWorkState {
  final String message;

  const GetWorkError({required this.message});

  @override
  List<Object> get props => [message];
}
