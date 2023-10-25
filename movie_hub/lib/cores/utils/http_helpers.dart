// import 'dart:convert';

// import 'package:http/http.dart' as http;

// import 'package:movie_hub/cores/utils/extension.dart';
// import 'package:movie_hub/cores/utils/type_defs.dart';

class HttpHelper {
  // //! ------- GET ------- !//
  // static Future<Mapped> get(
  //   String url, {
  //   Map<String, dynamic>? query,
  // }) async {
  //   if (query != null) {
  //     url += '?';

  //     query.forEach((key, value) {
  //       url += '&$key=$value';
  //     });
  //   }
  //   url.log();
  //   http.Response response =
  //       await http.get(Uri.parse(url)).timeout(const Duration(seconds: 30));
  //   response.body.log();
  //   final Mapped result = jsonDecode(response.body);
  //   if (response.statusCode >= 200 && response.statusCode < 300) {}
  // }
}
