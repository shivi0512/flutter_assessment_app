import 'dart:async';
import 'package:flutter_assessment_app/models/response/app_response.dart';
import 'package:get/get.dart';
import '../../../routes.dart';

class SplashController extends GetxController {
  RxList<DataList> dataList = RxList<DataList>([]);

  @override
  void onInit() {
    super.onInit();
    _loadWidget();
  }

  _loadWidget() async {
    var _duration = const Duration(seconds: 3);
    return Timer(_duration, (navigationPage));
  }

  void navigationPage() {
    Get.offNamed(Routes.dashboard);
  }

}
