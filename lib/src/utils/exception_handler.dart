import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exception_handler.freezed.dart';

@Freezed(toJson: false, fromJson: false)
class AppException with _$AppException implements Exception {
  const factory AppException({
    required String? message,
  }) = _AppException;
}

Future<T> handleException<T>(Future<T> Function() handler) async {
  try {
    return await handler();
  } catch (err) {
    String message = '';

    switch (err.runtimeType) {
      case const (SocketException):
        message = 'No network connection';
        break;

      case const (DioException):
        err as DioException;
        message = err.responseMessage ?? 'Internal Error occurred';
        break;

      case const (FirebaseAuthException):
        err as FirebaseAuthException;
        message = err.message ?? "Authentication failed";
        break;

      default:
        message = 'Unknown error occurred';
    }

    throw AppException(message: message);
  }
}

extension on DioException {
  String? get responseMessage {
    return switch (type) {
      DioExceptionType.badResponse => response?.data['message'],
      DioExceptionType.connectionError => "No network connection",
      _ => null,
    };
  }
}
