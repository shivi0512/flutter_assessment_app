import 'package:flutter_assessment_app/models/response/app_response.dart';
import 'package:get/get.dart';
import '../../../api/api_client.dart';

class DashboardController extends GetxController {
  final ApiClient _apiClient = Get.find<ApiClient>();
  RxList<DataList> dataList = RxList<DataList>([]);
RxString title = "".obs;

  @override
  void onReady() {
    super.onReady();
    getList();
  }

  void getList() async {
    _apiClient.getList().then((appResponse) {
      dataList.clear();
      title.value = appResponse?.title ?? "";
      dataList.addAll(appResponse?.rows ?? []);
    });
  }
}
