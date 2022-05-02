import 'package:cached_network_image/cached_network_image.dart';
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
          backgroundColor: Colors.teal,
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
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.teal.withOpacity(0.1),
                            spreadRadius: 10,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 8), // changes position of shadow
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: Get.width * .08,
                          vertical: Get.height * .02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Loads the images lazily
                          CachedNetworkImage(
                            imageUrl: row.imageHref ??
                                "",
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
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
