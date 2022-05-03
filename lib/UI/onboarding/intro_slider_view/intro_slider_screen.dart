// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_assessment_app/UI/onboarding/intro_slider_view/intro_slider_controller.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../routes.dart';

class IntroSliderScreen extends GetView<IntroSliderController> {
  const IntroSliderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            foregroundColor: Colors.white,
            leadingWidth: Get.width * 0.2,
            backgroundColor: Colors.white,
            actions: <Widget>[
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.dashboard);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10),
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              PageView(
                controller: controller.pageController,
                onPageChanged: (v) {
                  controller.currentPage.value = v;
                },
                physics: ClampingScrollPhysics(),
                children: [
                  _introWidget(
                    sliderImage:
                        "https://cdn.pixabay.com/photo/2019/02/05/07/52/pixel-cells-3976295__340.png",
                    middleText: "Think",
                    left: -40.0,
                    right: 0.0,
                    top: 99.0,
                  ),
                  _introWidget(
                    sliderImage:
                        "https://cdn.pixabay.com/photo/2021/05/05/04/42/pixel-cells-6230153__340.png",
                    middleText: "Build",
                    left: -20.0,
                    right: 0.0,
                    top: 0.0,
                  ),
                  _introWidget(
                    sliderImage:
                        "https://cdn.pixabay.com/photo/2021/05/05/04/49/pixel-cells-6230165__340.png",
                    middleText: "Create",
                    left: -20.0,
                    right: 0.0,
                    top: 29.0,
                  ),
                ],
              ),
              Positioned(
                bottom: 120,
                child: SmoothPageIndicator(
                  controller: controller.pageController!,
                  count: 3,
                  effect: WormEffect(
                      spacing: 8.0,
                      dotHeight: 4,
                      dotWidth: 14,
                      dotColor: Colors.grey,
                      activeDotColor: Colors.black),
                ),
              ),
              Positioned(
                bottom: 50,
                child: Obx(() => TextButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.resolveWith((states) =>
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(22))),
                          minimumSize: MaterialStateProperty.resolveWith(
                              (states) => Size(300, 40)),
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.teal)),
                      onPressed: () {
                        controller.gotoNextPage();
                      },
                      child: Text(
                        controller.currentPage.value == 2
                            ? "Let's Get Started"
                            : "Swipe Left",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: "Montserrat-SemiBold"),
                      ),
                    )),
              )
            ],
          )),
    );
  }

  Widget _introWidget(
      {String? sliderImage, String? middleText, double? left, right, top}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.network(
          sliderImage ?? "",
          height: Get.height * .3,
          width: Get.width * .8,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              middleText ?? "",
              style: TextStyle(
                fontSize: 30,
                color: Colors.teal,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
