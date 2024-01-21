import 'package:dio/dio.dart';
import 'package:native_dio_adapter/native_dio_adapter.dart';
import 'package:paymentapp/util/api/custom_interceptor.dart';

class ApiManager {
  static final ApiManager _manager = ApiManager._instance();
  ApiManager._instance();
  factory ApiManager() {
    return _manager;
  }

  static Dio init({required String basePath, required bool isFormRequest}) =>
      Dio(BaseOptions(
        baseUrl: basePath,
        sendTimeout: const Duration(milliseconds: 30000),
        receiveTimeout: const Duration(milliseconds: 30000),
        connectTimeout: const Duration(milliseconds: 30000),
        responseType: ResponseType.json,
      ))
        ..interceptors.add(CustomInterceptor())
        ..httpClientAdapter = NativeAdapter(
          createCupertinoConfiguration: () =>
              URLSessionConfiguration.ephemeralSessionConfiguration()
                ..allowsCellularAccess = true
                ..allowsConstrainedNetworkAccess = true
                ..allowsExpensiveNetworkAccess = true,
        );
}
