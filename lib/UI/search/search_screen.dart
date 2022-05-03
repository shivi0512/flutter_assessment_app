// import 'dart:collection';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../models/response/app_response.dart';
// import '../../widgets/my_behaviour.dart';
// import '../dashboard/conponents/custom_container_widget.dart';
//
// class SearchScreen extends StatefulWidget {
//   const SearchScreen({Key? key}) : super(key: key);
//
//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }
//
// class _SearchScreenState extends State<SearchScreen> {
//   Icon customIcon = const Icon(Icons.search);
//   Widget customSearchBar = const Text('Search Here');
//   TextEditingController search = TextEditingController();
//   ValueNotifier<int> buttonClickedTimes = ValueNotifier(0);
//   List<DataList> dataList = [];
//
//   @override
//   void initState() {
//     dataList = HashMap.from(Get.arguments ?? {})["data_list"];
//     super.initState();
//     // _initializeAndPlay(0);
//   }
//
//   @override
//   void dispose() {
//     search.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.teal,
//         title: customSearchBar,
//         automaticallyImplyLeading: false,
//         actions: [
//           IconButton(
//             onPressed: () {
//               setState(() {
//                 if (customIcon.icon == Icons.search) {
//                   customIcon = const Icon(Icons.cancel);
//                   customSearchBar = ListTile(
//                     leading: const Icon(
//                       Icons.search,
//                       color: Colors.white,
//                       size: 28,
//                     ),
//                     title: TextFormField(
//                       onChanged: (val){
//                         final dataShow = dataList.where((e) {
//                           final titleLower = e.title?.toLowerCase();
//                           final searchLower = search.text.toLowerCase();
//                           return titleLower!.contains(searchLower);
//                         }).toList();
//                         setState(() {
//                           search.text = val;
//                           dataList = dataShow;
//                         });
//                       },
//                       onEditingComplete: () {
//                         final dataShow = dataList.where((e) {
//                           final titleLower = e.title?.toLowerCase() ?? "";
//                           final searchLower = search.text.toLowerCase();
//                           return titleLower.contains(searchLower);
//                         }).toList();
//                         setState(() {
//                           dataList = dataShow;
//                         });
//                       },
//                       onSubmitted: (val) {
//                         final dataShow = dataList.where((e) {
//                           final titleLower = e.title?.toLowerCase();
//                           final searchLower = search.text.toLowerCase();
//                           return titleLower!.contains(searchLower);
//                         }).toList();
//                         setState(() {
//                           search.text = val;
//                           dataList = dataShow;
//                         });
//                       },
//                       controller: search,
//                       decoration: const InputDecoration(
//                         hintText: 'search data by title....',
//                         hintStyle: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                           fontStyle: FontStyle.italic,
//                         ),
//                         border: InputBorder.none,
//                       ),
//                       style: const TextStyle(
//                         color: Colors.white,
//                       ),
//                     ),
//                   );
//                 } else {
//                   customIcon = const Icon(Icons.search);
//                   customSearchBar = const Text('Search here');
//                 }
//               });
//             },
//             icon: customIcon,
//           )
//         ],
//         centerTitle: true,
//       ),
//       body: ScrollConfiguration(
//         behavior: MyBehavior(),
//         child: ListView.builder(
//           itemCount: dataList.length,
//           shrinkWrap: true,
//           itemBuilder: (context, index) {
//             DataList row = dataList[index];
//             return CustomContainerWidget(row: row);
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_assessment_app/UI/search/search_controller.dart';
import 'package:get/get.dart';

import '../../models/response/app_response.dart';
import '../../widgets/my_behaviour.dart';
import '../dashboard/conponents/custom_container_widget.dart';

class SearchScreen extends GetView<SearchController> {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Obx(
          () => (controller.dataList.isEmpty && controller.search.text == "-1")
              ? const SizedBox.shrink()
              : TextFormField(
                  onChanged: (val) {
                    controller.dataShow.value = controller.dataList.where((e) {
                      final titleLower = e.title?.toLowerCase() ?? "";
                      return titleLower.contains(val.toLowerCase());
                    }).toList();
                  },
            onEditingComplete: (){

                    controller.dataShow.value = controller.dataList.where((e) {
                final titleLower = e.title?.toLowerCase() ?? "";
                return titleLower.contains(controller.search.text.toLowerCase());
              }).toList();
            },
                  controller: controller.search,
                  decoration: const InputDecoration(
                    hintText: 'search data by title....',
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                    ),
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: Obx(
          () => (controller.dataShow.isEmpty)
              ? const SizedBox.shrink()
              : ListView.builder(
                  itemCount: controller.dataShow.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    DataList row = controller.dataShow[index];
                    return CustomContainerWidget(row: row);
                  },
                ),
        ),
      ),
    );
  }
}
