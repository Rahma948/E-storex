import 'dart:io';
import 'package:dio/dio.dart';
import 'api_error_model.dart';

class ErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      return _handleDioError(error);
    } else if (error is SocketException) {
      return ApiErrorModel(
        message: "No internet connection.",
        errors: ["Please check your connection and try again."],
        statusCode: 0,
      );
    } else if (error is FormatException) {
      return ApiErrorModel(
        message: "Data format error.",
        errors: ["Invalid response format from server."],
        statusCode: 0,
      );
    } else {
      return ApiErrorModel(
        message: "Unexpected error occurred.",
        errors: ["Something went wrong. Please try again later."],
        statusCode: 0,
      );
    }
  }

  static ApiErrorModel _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiErrorModel(
          message: "Connection timeout.",
          errors: ["The server took too long to respond."],
          statusCode: 0,
        );
      case DioExceptionType.sendTimeout:
        return ApiErrorModel(
          message: "Send timeout.",
          errors: ["Request took too long to send."],
          statusCode: 0,
        );
      case DioExceptionType.receiveTimeout:
        return ApiErrorModel(
          message: "Receive timeout.",
          errors: ["Server took too long to send data."],
          statusCode: 0,
        );
      case DioExceptionType.badResponse:
        final data = error.response?.data;
        try {
          final model = ApiErrorModel.fromJson(data);
          return model;
        } catch (_) {
          return ApiErrorModel(
            message: "Server error.",
            errors: ["An error occurred while processing your request."],
            statusCode: error.response?.statusCode ?? 0,
          );
        }
      case DioExceptionType.cancel:
        return ApiErrorModel(
          message: "Request cancelled.",
          errors: ["The request was cancelled by the user."],
          statusCode: 0,
        );
      case DioExceptionType.unknown:
      default:
        return ApiErrorModel(
          message: "Network error.",
          errors: ["Failed to connect to the server."],
          statusCode: 0,
        );
    }
  }
}