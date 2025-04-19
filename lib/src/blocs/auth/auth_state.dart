part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthAuthenticated extends AuthState {
  final String? accessToken;
  final String? refreshToken;
  final String userId;

  const AuthAuthenticated({this.accessToken, this.refreshToken, required this.userId});

  @override
  List<Object> get props => [accessToken ?? '', refreshToken ?? '', userId];
}

class AuthSuccess extends AuthState {
  final String message;

  const AuthSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

class UnAuthenticated extends AuthState {
  const UnAuthenticated();
}

class AuthError extends AuthState {
  final String message;

  const AuthError({required this.message});

  @override
  List<Object> get props => [message];
}
