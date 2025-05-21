import 'package:dio/src/response.dart';
import 'package:my_app/src/models/auth/request/login_request.dart';
import 'package:my_app/src/models/auth/request/register_request.dart';
import 'package:my_app/src/models/auth/response/auth_response.dart';
import 'package:my_app/src/models/auth/response/user_info_response.dart';
import 'package:my_app/src/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final UserService userService;
  final SharedPreferences sharedPreferences;

  AuthRepository({
    required this.userService,
    required this.sharedPreferences,
  });

  Future<AuthResponse> login(LoginRequest loginRequest) async {
    try {
      final response = await userService.login(loginRequest);
      if (response.statusCode != 200) {
        throw Exception('Login failed: ${response.statusMessage}');
      }
      final authResponse = AuthResponse.fromJson(response.data['value']);
      final tokenResponse = authResponse.tokenResponse;
      final userData = authResponse.userData;
      final token = tokenResponse?.accessToken;
      final refreshToken = tokenResponse?.refreshToken;
      final userId = userData.id;
      // Store tokens in shared preferences
      await sharedPreferences.setString('email', loginRequest.userName);
      await sharedPreferences.setString('access_token', token ?? '');
      await sharedPreferences.setString('refresh_token', refreshToken ?? '');
      await sharedPreferences.setString('user_id', userId);

      return authResponse;
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  Future<void> logout() async {
    await sharedPreferences.clear();
  }

  Future<Response> register(RegisterRequest registerRequest) async {
    return await userService.register(registerRequest);
  }

  Future<UserInfoResponse> getUserInfo() async {

    final response = await userService.getUserInfo();
    return response;
  }
}
