import 'package:dio/dio.dart';

class NetworkOptions {
  NetworkOptions._privateConstructor();
  static final NetworkOptions instance = NetworkOptions._privateConstructor();
  final dio = Dio()
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          return handler.next(response);
        },
        onError: (DioException error, ErrorInterceptorHandler handler) {
          return handler.next(error);
        },
      ),
    );

  Future<Response> getReq({required String url, dynamic data}) async {
    final Response response = await dio.get(url, data: data);
    return response;
  }

  Future<Response> postReq({required String url, required Map<dynamic, dynamic> data}) async {
    final Response response = await dio.post(
      url,
      data: data,
    );
    return response;
  }
}
