import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:movie_hub/cores/cores.dart';

class ServiceResponse<T> {
  String? message;
  bool error;
  T? data;

  ServiceResponse({
    this.message,
    required this.error,
    this.data,
  });

  NotifierState<T> convertToNotifierState() {
    return NotifierState<T>(
      data: data,
      message: message,
      status: error ? NotifierStatus.error : NotifierStatus.done,
    );
  }
}

ServiceResponse<T> serveError<T>({required String errorMessage}) {
  return ServiceResponse<T>(
    error: true,
    message: errorMessage,
  );
}

ServiceResponse<T> serveData<T>({
  required T? data,
  String? message,
}) {
  return ServiceResponse(
    error: false,
    data: data,
    message: message,
  );
}

Future<ServiceResponse<T>> serveFuture<T>({
  required Future<T> Function(Fail fail) function,
  String Function(Object e)? handleError,
  String Function(T response)? handleData,
}) async {
  try {
    final T response = await function(_fail);
    String? message;
    if (handleData != null) {
      message = handleData(response);
    }
    return serveData(data: response, message: message);
  } on ServeException catch (e) {
    return serveError(errorMessage: e.message);
  } on FormatException catch (e, s) {
    AppLogger.log(e, s);
    if (kDebugMode) {
      return serveError(errorMessage: 'Unable To Format Data');
    }

    return serveError(errorMessage: 'Something went wrong, please try again');
  } on TimeoutException catch (e, s) {
    AppLogger.log(e, s);
    return serveError(
      errorMessage:
          'Request Timeout, Unable to connect to server please check your network and try again!',
    );
  } on SocketException catch (e, s) {
    AppLogger.log(e, s);
    return serveError(
      errorMessage:
          'Unable to connect to server please check your network and try again!',
    );
  } catch (e) {
    throw e.toString();
  }
}

typedef Fail = Function(String message);

Never _fail(String message) => throw ServeException(message);

class ServeException implements Exception {
  late final String message;
  ServeException(
    this.message,
  );
}
