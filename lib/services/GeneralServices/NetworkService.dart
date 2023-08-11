import 'package:dio/dio.dart';


class NetworkService {
  static String baseUrl = "http://192.168.1.8:3000/api/v1/";
  static late Dio instance;
  static String accessToken = "";

  static void initDio() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: const Duration(seconds: 5),
      connectTimeout: const Duration(seconds: 5),
      contentType: 'application/json',
    );
    instance = Dio(options);
    instance.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handeler) async {
          options.headers['token'] = 'Bearer $accessToken';
          return handeler.next(options);
        },
      ),
    );
  }

  static void refreshAccessToken(String token) {
    accessToken = token;
    instance.interceptors.last = InterceptorsWrapper(
      onRequest: (options, handeler) async {
        options.headers['token'] = 'Bearer $accessToken';
        return handeler.next(options);
      },
    );
  }
}
