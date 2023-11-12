import 'package:movie_hub/cores/framework/frame_work.dart';

Future<NotifierState<Response>> convert<Response>(
  MainFunction<Response> func, {
  Function(ServiceResponse<Response>)? then,
}) async {
  var response = await func();
  then?.call(response);
  return response.convertToNotifierState();
}

Future<NotifierState<Response>> convertWithArgument<Response, Argument>(
  MainFunctionWithArgument<Response, Argument> func,
  Argument argument, {
  Function(ServiceResponse<Response>)? then,
}) async {
  var response = await func(argument);
  then?.call(response);
  return response.convertToNotifierState();
}

typedef MainFunction<Response> = Future<ServiceResponse<Response>> Function();
typedef MainFunctionWithArgument<Response, Argument>
    = Future<ServiceResponse<Response>> Function(Argument argument);
