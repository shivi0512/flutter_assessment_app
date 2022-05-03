import 'package:flutter/material.dart';
import 'package:flutter_assessment_app/models/response/app_response.dart';
import 'package:get/get.dart';
import '../../../api/api_client.dart';
import '../../routes.dart';

class DashboardController extends GetxController {
  final ApiClient _apiClient = Get.find<ApiClient>();
  RxList<DataList> dataList = RxList<DataList>([]);
  RxString title = "".obs;

  // ignore: prefer_typing_uninitialized_variables
  var scaffoldKey;

  @override
  void onInit() {
    scaffoldKey = GlobalKey<ScaffoldState>();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getList();
  }

  //This method will run when widget is unmounting
  @override
  void dispose() {
    // disposing states
    scaffoldKey?.currentState?.dispose();
    super.dispose();
  }

  void getList() async {
    _apiClient.getList().then((appResponse) {
      dataList.clear();
      title.value = appResponse?.title ?? "";
      dataList.addAll(appResponse?.rows ?? []);
    });
  }

  void pullRefreshed() {
    getList();
    scaffoldKey.currentState.showSnackBar(
      const SnackBar(
        content: Text('Page Refreshed'),
      ),
    );
  }

  void onclick() {
    Get.toNamed(Routes.searchScreen, arguments: {
      "data_list": dataList,
    });
  }
}
