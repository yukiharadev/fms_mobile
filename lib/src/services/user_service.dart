import 'package:dio/dio.dart';
import 'package:my_app/src/models/auth/request/login_request.dart';
import 'package:my_app/src/models/auth/request/register_request.dart';
import 'package:my_app/src/models/auth/response/user_info_response.dart';
import 'package:my_app/src/services/dio_client.dart';
import 'package:talker/talker.dart';

class UserService {
  final DioClient dioClient;

  UserService({required this.dioClient});

  Future<Response> login(LoginRequest loginRequest) async {
    Talker talker = Talker();
    talker.info("URL: ${dioClient.dio.options.baseUrl}/auth-service/auth/login");
    final response = await dioClient.dio.post(
      '/auth-service/auth/login',
      data: loginRequest.toJson(),
    );

    return response;
  }

  Future<UserInfoResponse> getUserInfo() async {

    final response = await dioClient.dio.get(
      '/auth-service/userinfo',
    );

    return UserInfoResponse.fromJson(response.data['value']);
  }

  Future<Response> register(RegisterRequest registerRequest) async {
    return await dioClient.dio.post(
      '/auth-service/auth/register',
      data: registerRequest.toJson(),
    );
  }
}
