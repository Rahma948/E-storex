import 'api_error_model.dart';

class ApiResult<T> {
  final T? data;
  final ApiErrorModel? error;
  final bool isSuccess;

  ApiResult._({this.data, this.error, required this.isSuccess});

  /// Success factory
  factory ApiResult.success(T data) {
    return ApiResult._(data: data, error: null, isSuccess: true);
  }

  /// Failure factory
  factory ApiResult.failure(ApiErrorModel error) {
    return ApiResult._(data: null, error: error, isSuccess: false);
  }

  // /// Map success to another type
  // ApiResult<R> map<R>(R Function(T value) mapper) {
  //   if (!isSuccess || data == null) {
  //     return ApiResult.failure(error!);
  //   }
  //   return ApiResult.success(mapper(data as T));
  // }

  /// Get all error messages as a single string separated by new lines
  String get errorMessage {
    if (error != null) {
      final errs = error!.errors;

      if (errs != null && errs.isNotEmpty) {
        // join all errors separated by newline
        return errs.join('\n');
      }

      if (error!.message != null && error!.message!.isNotEmpty) {
        return error!.message!;
      }
    }

    return 'Unknown error';
  }
}