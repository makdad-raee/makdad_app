import 'package:dio/dio.dart';

Map<String, dynamic> headersList = {
  'Accept': '*/*',
  'Content-Type': 'application/json',
  'Authorization':
      'key=AAAAQ7As_k0:APA91bGXFX9Fn0dOMs8yysBvzMs8NpdU206C5EYQZOSaACbHPBFdPzLXRxT3qtzOTBi_WEd3Soa5L5h5shN0zRB6_50-NdnW45YYiSnex2K6ruq40hyiam1yf4fl6cPF1-zZngZ8lH5N'
};

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
        headers: headersList,
        baseUrl: 'https://fcm.googleapis.com/fcm/send',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    return await dio!.get(url, queryParameters: query);
  }

  // static Future<Response> postData({
  //   required String url,
  //   required Map<String, dynamic> query,
  // }) async {
  //   return await dio!.post(url, queryParameters: query, options: Options());
  // }
}
