import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  /// Private constructor
  DioFactory._();

  static Dio? dio;

  /// Dio العادي لجميع الطلبات العادية
  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;

      addDioHeaders();
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  /// إضافة headers افتراضية
  static void addDioHeaders() {
    dio?.options.headers = {
      'Accept': 'application/json',
      'X-API-KEY':
          "ovuPaA2bJcgksW6yONrlDYtKweqihHfGnd9pI1FMVRmCTzE7UBx03SXZ8QL5j4",
    };
  }

  /// Dio بدون متابعة redirect (مهم للـ External Login)
  static Dio getDioWithoutRedirects() {
    final dioNoRedirect = Dio()
      ..options.connectTimeout = const Duration(seconds: 30)
      ..options.receiveTimeout = const Duration(seconds: 30)
      ..options.headers = {
        'Accept': 'application/json',
        'X-API-KEY':
            "e522c4b2d8e737a8046bd402903112373f9a444bb9cb72a9cc151fa20e3a793a",
      }
      // مهم جدًا: ما يتبعش redirects تلقائيًا
      ..options.followRedirects = false
      // عشان 302 يعتبر نجاح حتى لو بدون redirect
      ..options.validateStatus = (status) => status != null && status < 400;

    // Pretty logger لعرض request/response
    dioNoRedirect.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );

    return dioNoRedirect;
  }

  /// تحديث Authorization header بعد تسجيل الدخول
  static void setTokenIntoHeaderAfterLogin(String token) {
    dio?.options.headers['Authorization'] = 'Bearer $token';
  }

  /// إضافة interceptor للطباعة
  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
