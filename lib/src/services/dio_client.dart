import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_app/src/utils/constants.dart';

class DioClient {
  late final Dio _dio;
  late final SharedPreferences sharedPreferences;

  DioClient({required this.sharedPreferences}) : _dio = Dio() {
    _dio.options.baseUrl = Constants.baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 5);
    _dio.options.receiveTimeout = const Duration(seconds: 10);
    _dio.interceptors.add(_authInterceptor());
  }

  Interceptor _authInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) {
        final token = sharedPreferences.getString('access_token');
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onError: (DioException error, ErrorInterceptorHandler handler) async {
        if (error.response?.statusCode == 401) {
          final refreshToken = sharedPreferences.getString('refresh_token');
          final userId = sharedPreferences.getString('user_id');
          final accessToken = sharedPreferences.getString('access_token');
          if (refreshToken != null) {
            try {
              final headers = {
                "x-client-request": userId,
                "x-refresh-token": refreshToken,
                "Authorization": 'Bearer $accessToken',
              };
              final response = await _dio.post(
                '/auth-service/auth/refresh-token',
                options: Options(headers: headers),
              );
              final newAccessToken = response.data['value']['tokenResponse']['accessToken'];
              final newRefreshToken = response.data['value']['tokenResponse']['refreshToken'];
              await sharedPreferences.setString('access_token', newAccessToken);
              await sharedPreferences.setString('refresh_token', newRefreshToken);

              error.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
              final retryResponse = await _dio.fetch(error.requestOptions);
              return handler.resolve(retryResponse);
            } catch (e) {
              await sharedPreferences.clear();
              return handler.reject(error);
            }
          }
        }
        return handler.next(error);
      },
    );
  }

  Dio get dio => _dio;
}
