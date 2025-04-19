part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginRequested extends AuthEvent {
  final LoginRequest loginRequest;
  const LoginRequested({required this.loginRequest});

  @override
  List<Object> get props => [loginRequest];
}

class LogoutRequested extends AuthEvent {}

class UserInfoRequested extends AuthEvent {
  const UserInfoRequested();
}

class CheckAuthStatus extends AuthEvent {
  const CheckAuthStatus();
}

class RegisterRequested extends AuthEvent {
  final RegisterRequest registerRequest;
  const RegisterRequested({required this.registerRequest});

  @override
  List<Object> get props => [registerRequest];
}
