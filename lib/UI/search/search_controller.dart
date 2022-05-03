import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_assessment_app/models/response/app_response.dart';
import 'package:get/get.dart';


class SearchController extends GetxController {
  RxBool dataSearch = false.obs;
  RxString searchData = "".obs;
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('Search Here');
  RxList<DataList> dataList = RxList<DataList>([]);
  RxList<DataList> dataShow = RxList<DataList>([]);

  TextEditingController search = TextEditingController();

  @override
  void onInit() {
    dataList.value = HashMap.from(Get.arguments ?? {})["data_list"];
    super.onInit();
  }

}