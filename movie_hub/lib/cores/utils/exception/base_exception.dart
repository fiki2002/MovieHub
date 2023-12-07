
import 'package:movie_hub/cores/cores.dart';

class BaseFailures extends Failure {
  const BaseFailures({required String message, StackTrace? trace})
      : super(message: message, trace: trace);
}

class SocketFailures extends Failure {
  const SocketFailures({required String message, StackTrace? trace})
      : super(message: message, trace: trace);
}
