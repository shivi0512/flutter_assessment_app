import 'package:flutter_assessment_app/models/response/app_response.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import '../constants/api_end_points.dart';
import '../constants/constants.dart';
export 'package:flutter_assessment_app/constants/extension.dart';


class ApiClient extends GetConnect {
  @override
  void onInit() {

    super.onInit();
    httpClient.baseUrl = Constants.baseUrl;
    httpClient.addRequestModifier((Request request) {
      print(request.method.toUpperCase() + " " + request.url.toString());
      print(request.headers);
      return request;
    });

    httpClient.addResponseModifier(
      (request, response) {
        print(response.headers);
      },
    );
  }

  // GET APP RESPONSE LIST
  Future<Response<AppResponse>> getList() =>
      get(ApiEndPoints.fetchData, query: {}, decoder: (v) {
        print(v);
        return AppResponse.fromJson(v);
      });




}
