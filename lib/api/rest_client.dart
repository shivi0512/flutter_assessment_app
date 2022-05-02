import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

/// Network Util Class -> A utility class for handling datamanager.network operations
class RestClient {
  //----------------------------------------------------------- Singleton-Instance ------------------------------------------------------------------
  // Singleton Instance
  static final RestClient _instance =  RestClient.internal();

  /// RestClient Private Constructor -> NetworkUtil
  /// @param -> _
  /// @usage -> Returns the instance of NetworkUtil class
  RestClient.internal();

  /// RestClient Factory Constructor -> NetworkUtil
  /// @dependency -> _
  /// @usage -> Returns the instance of NetworkUtil class
  factory RestClient() => _instance;

  //------------------------------------------------------------- Variables ---------------------------------------------------------------------------
  // JsonDecoder object
  final JsonDecoder _decoder =  const JsonDecoder();

  //------------------------------------------------------------- Methods -----------------------------------------------------------------------------
  /// Get Method -> Future<dynamic>
  /// @param -> @required url -> String
  /// @usage -> Make HTTP-GET request to specified URL and returns the response in JSON format
  Future<dynamic> get(
      {required String url, Map<String, String>? headers}) async {
    headers ??=  {};

    return http.get(Uri.parse(url), headers: headers) // Make HTTP-GET request
        .then((http.Response response) {
      // On response received
      // Get response status code
      final int statusCode = response.statusCode;
      print('get $url -> ${response.statusCode}');
      // Check response status code for error condition

      if (statusCode < 200 || statusCode > 499) {
        // Error occurred
        throw  Exception("Error while fetching data");
      } else {
        // No error occurred
        // Get response body
        final String res = utf8.decode(response.bodyBytes);
        print('Response ->$res');
        // Convert response body to JSON object
        return _decoder.convert(res);
      }
    }, onError: (dynamic error) {
      if (error != null && error is Exception) {
        throw error;
      } else {
        return null;
      }
    });
  }

  }

