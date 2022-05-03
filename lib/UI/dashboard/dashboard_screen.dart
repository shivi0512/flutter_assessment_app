import 'package:flutter/material.dart';
import 'package:flutter_assessment_app/UI/dashboard/conponents/custom_container_widget.dart';
import 'package:flutter_assessment_app/models/response/app_response.dart';
import 'package:flutter_assessment_app/widgets/my_behaviour.dart';
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
            leadingWidth: 0,
            title: Obx(() => Text(controller.title.value)),
          ),
          floatingActionButton:  FloatingActionButton(
              elevation: 2,
              child:  const Icon(Icons.search),
              backgroundColor: Colors.teal,
              onPressed: (){
                controller.onclick();
              }
          ),
          body: RefreshIndicator(
            child: Obx(
              () => (controller.dataList.isEmpty)
                  ? const SizedBox.shrink()
                  : ScrollConfiguration(
                behavior: MyBehavior(),
                    child: ListView.builder(
                        itemCount: controller.dataList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          DataList row = controller.dataList[index];
                          return CustomContainerWidget(row: row);
                        },
                      ),
                  ),
            ),
            onRefresh: () {
              return Future.delayed(
                const Duration(seconds: 1),
                () {
                 controller.pullRefreshed();
                },
              );
            },
          )),
    );
  }
}
