import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/src/models/auth/request/login_request.dart';
import 'package:my_app/src/models/auth/request/register_request.dart';
import 'package:my_app/src/repositories/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  final SharedPreferences sharedPreferences;

  // Constructor
  AuthBloc({required this.authRepository, required this.sharedPreferences}) : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<CheckAuthStatus>(_onCheckAuthStatus);
    on<RegisterRequested>(_onRegisterRequested);
  }
  Future<void> _onLoginRequested(LoginRequested event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    try {
      final authResponse = await authRepository.login(event.loginRequest);
      final accessToken = authResponse.tokenResponse?.accessToken;
      final refreshToken = authResponse.tokenResponse?.refreshToken;
      final userId = authResponse.userData.id;
      emit(AuthAuthenticated(accessToken: accessToken, refreshToken: refreshToken, userId: userId));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> _onCheckAuthStatus(CheckAuthStatus event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final accessToken = sharedPreferences.getString('access_token');
    final userId = sharedPreferences.getString('user_id');
    final refreshToken = sharedPreferences.getString('refresh_token');
    if (accessToken != null && userId != null) {
      emit(AuthAuthenticated(userId: userId, accessToken: accessToken, refreshToken: refreshToken));
    } else {
      emit(UnAuthenticated());
    }
  }

  Future<void> _onLogoutRequested(LogoutRequested event, Emitter<AuthState> emit) async {
    await authRepository.logout();
    emit(const AuthInitial());
  }

  Future<void> _onRegisterRequested(RegisterRequested event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    try {
      await authRepository.register(event.registerRequest);
      emit(const AuthSuccess(message: "Registration successful"));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }
}
