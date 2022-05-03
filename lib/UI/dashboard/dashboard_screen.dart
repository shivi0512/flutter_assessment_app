import 'package:flutter/material.dart';
import 'package:flutter_assessment_app/UI/dashboard/conponents/custom_container_widget.dart';
import 'package:flutter_assessment_app/models/response/app_response.dart';
import 'package:flutter_assessment_app/routes.dart';
import 'package:get/get.dart';
import 'dashboard_controller.dart';

class DashboardScreen extends GetWidget<DashboardController> {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: controller.scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.teal,
            centerTitle: true,
            elevation: 0,
            leadingWidth: Get.width * 0.2,
            title: Obx(() => Text(controller.title.value)),
          ),
          floatingActionButton:  FloatingActionButton(
              elevation: 2,
              child:  const Icon(Icons.search),
              backgroundColor: Colors.teal,
              onPressed: (){
                Get.toNamed(Routes.searchScreen);
              }
          ),
          body: RefreshIndicator(
            child: Obx(
              () => (controller.dataList.isEmpty)
                  ? const SizedBox.shrink()
                  : ListView.builder(
                      itemCount: controller.dataList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        DataList row = controller.dataList[index];
                        return CustomContainerWidget(row: row);
                      },
                    ),
            ),
            onRefresh: () {
              return Future.delayed(
                const Duration(seconds: 1),
                () {
                  controller.getList();
                  controller.scaffoldKey.currentState.showSnackBar(
                    const SnackBar(
                      content: Text('Page Refreshed'),
                    ),
                  );
                },
              );
            },
          )),
    );
  }
}
