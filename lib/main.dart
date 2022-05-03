import 'package:flutter/material.dart';
import 'package:flutter_assessment_app/routes.dart';
import 'package:get/get.dart';
import 'api/api_client.dart';
import 'binders.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ApiClient());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Swap Karo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          backgroundColor: Colors.transparent,
        ),
        initialRoute: Routes.splashScreen,
        getPages:Binders.dependencies());
  }
}