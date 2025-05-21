part of 'user_info_bloc.dart';

sealed class UserInfoEvent extends Equatable {
  const UserInfoEvent();
}

final class UserInfoRequested extends UserInfoEvent {
  const UserInfoRequested();

  @override
  List<Object> get props => [];
}