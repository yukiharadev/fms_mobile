part of 'user_info_bloc.dart';

sealed class UserInfoState extends Equatable {
  const UserInfoState();

  @override
  List<Object> get props => [];
}

final class UserInfoInitial extends UserInfoState {
  const UserInfoInitial();
}

final class UserInfoLoading extends UserInfoState {
  const UserInfoLoading();
}

final class UserInfoSuccess extends UserInfoState {
  final UserInfoResponse userInfoResponse;

  const UserInfoSuccess({required this.userInfoResponse});

  @override
  List<Object> get props => [userInfoResponse];
}

final class UserInfoError extends UserInfoState {
  final String message;

  const UserInfoError({required this.message});

  @override
  List<Object> get props => [message];
}
