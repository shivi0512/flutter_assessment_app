import 'dart:developer';

import 'package:flutter_assessment_app/api/rest_client.dart';
import '../constants/api_end_points.dart';
import '../models/response/app_response.dart';

class ApiClient {
  Future<AppResponse?> getList() async {
    return RestClient().get(url: ApiEndPoints.fetchData).then(
        (dynamic response) {
      try {
        if (response != null) return AppResponse.fromJson(response);
      } catch (e) {
        log(e.toString());
      }
      return null;
    }, onError: (dynamic error) {
      throw error;
    });
  }
}
