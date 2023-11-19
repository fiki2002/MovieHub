import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:movie_hub/cores/cores.dart';

final Map<String, String> headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer $apiReadAccessToken'
};

class HttpHelper {
  // //! ------- GET ------- !//
  static Future<Mapped> get(
    String url, {
    Map<String, dynamic>? query,
    Map<String, String>? header,
  }) async {
    try {
      if (query != null) {
        url += '?';

        query.forEach((key, value) {
          url += '&$key=$value';
        });
      }
      http.Response response = await http
          .get(
            Uri.parse(url),
            headers: header ?? headers,
          )
          .timeout(
            const Duration(seconds: 30),
          );

      final Mapped result = jsonDecode(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return result;
      } else {
        throw result['message'];
      }
    } on ClientException {
      throw 'Failed to fetch data. Please check your internet connection.';
    } on FormatException {
      if (kDebugMode) {
        throw 'Unable To Format Data!';
      }
      throw 'Something went wrong, please try again';
    } on SocketException catch (e, s) {
      e.log(s);
      throw 'Unable to connect to server please check your network and try again!';
    } on TimeoutException catch (e, s) {
      e.log(s);
      throw 'Request Timeout, Unable to connect to server please check your network and try again!';
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<String> getString(String url) async {
    try {
      http.Response response = await http
          .get(
            Uri.parse(url),
          )
          .timeout(
            const Duration(seconds: 30),
          );

      final String result = response.body;
      return result;
    } on ClientException {
      throw 'Failed to fetch data. Please check your internet connection.';
    } on FormatException {
      if (kDebugMode) {
        throw 'Unable To Format Data!';
      }
      throw 'Something went wrong, please try again';
    } on SocketException catch (e, s) {
      e.log(s);
      throw 'Unable to connect to server please check your network and try again!';
    } on TimeoutException catch (e, s) {
      e.log(s);
      throw 'Request Timeout, Unable to connect to server please check your network and try again!';
    } catch (e) {
      throw e.toString();
    }
  }
}
