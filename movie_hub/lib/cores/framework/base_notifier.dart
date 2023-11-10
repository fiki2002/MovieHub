import 'package:flutter/material.dart';

class BaseNotifier<T> extends ChangeNotifier {
  NotifierState<T> state = NotifierState();

  BaseNotifier() {
    onInit();
  }

  void onInit() {}

  void setLoading() {
    state = NotifierState(status: NotifierStatus.loading);
    notifyListeners();
  }

  void setError(String message) {
    state = NotifierState(
      status: NotifierStatus.error,
      message: message,
    );
    notifyListeners();
  }

  void setData(T data) {
    state = NotifierState(
      status: NotifierStatus.done,
      data: data,
    );
    notifyListeners();
  }

  void setIdle() {
    state = NotifierState(status: NotifierStatus.idle);
    notifyListeners();
  }
}

typedef FutureNotifierState<T> = Future<NotifierState<T>>;

class NotifierState<T> {
  final T? data;
  final NotifierStatus status;
  final String? message;

  NotifierState({
    this.data,
    this.status = NotifierStatus.idle,
    this.message,
  });

  bool get isDone => status == NotifierStatus.done;
  bool get isIdle => status == NotifierStatus.idle;
  bool get isLoading => status == NotifierStatus.loading;
  bool get hasError => status == NotifierStatus.error;

  Widget when({
    required Widget Function(T data) done,
    required Widget Function(String? message) error,
    required Widget Function() loading,
    Widget Function()? idle,
  }) {
    switch (status) {
      case NotifierStatus.done:
        {
          return done(data as T);
        }

      case NotifierStatus.idle:
        {
          if (idle == null) {
            return const SizedBox.shrink();
          }
          return idle();
        }

      case NotifierStatus.error:
        {
          return error(message);
        }

      case NotifierStatus.loading:
        {
          return loading();
        }
    }
  }
}

enum NotifierStatus { loading, idle, done, error }
