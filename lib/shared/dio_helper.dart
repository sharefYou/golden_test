import 'package:dio/dio.dart';

class DioHelper {
  static const String baseURL = 'https://ofrlk.com/api/';

  static Dio? dio;

  static initialDio() {
    dio = Dio(BaseOptions(
      baseUrl: baseURL,
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? query,
  }) async {
    return await dio!.get(
      endPoint,
      queryParameters: query,
    );
  }
}
