import 'package:flutter/material.dart';
import 'package:flutter_assessment_app/models/response/app_response.dart';
import 'package:get/get.dart';
import 'dashboard_controller.dart';

class DashboardScreen extends GetWidget<DashboardController> {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          leadingWidth: Get.width * 0.2,
          title: Obx(() => Text(controller.title.value)),
        ),
        body: Obx(
          () => (controller.dataList.isEmpty)
              ? const SizedBox.shrink()
              : ListView.builder(
                  itemCount: controller.dataList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    DataList row = controller.dataList[index];
                    return Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: Get.width * .08,
                          vertical: Get.height * .02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                              row.imageHref ??
                                  "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png",
                              errorBuilder: (context, error, stackTrace) =>
                                  Image.network(
                                      "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png")),
                          Text(
                            row.title ?? "No Title",
                            style: const TextStyle(
                                color: Colors.teal,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            row.description ?? "No Description",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
