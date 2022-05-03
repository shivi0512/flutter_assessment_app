import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes.dart';

class IntroSliderController extends GetxController {
  RxInt currentPage = 0.obs;
  PageController? pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
  }

  @override
  void onReady() {
    super.onReady();
  }

  gotoNextPage() {
    if (currentPage.value == 0 ||
        currentPage.value == 1 ||
        currentPage.value == 2) {
      pageController?.animateToPage(++currentPage.value,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
    if (currentPage.value == 3) {
      Get.offAllNamed(Routes.dashboard);
    }
  }

  @override
  void onClose() {
    currentPage.close();
    pageController?.dispose();
  }
}
