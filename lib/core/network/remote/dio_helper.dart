import 'package:breaking_bad/core/constants/strings.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(
        BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: 20 * 10000,
      connectTimeout: 20 * 10000,
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response>getData(String path,{Map<String,dynamic>? parameter})async{
  return await dio.get(path,queryParameters: parameter);
  }
}
