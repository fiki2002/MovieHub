
import 'package:movie_hub/cores/framework/frame_work.dart';

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
  } catch (e) {
    String error = handleError == null ? e.toString() : handleError(e);
    return serveError(errorMessage: error);
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
