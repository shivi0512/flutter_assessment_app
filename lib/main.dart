import 'package:flutter/material.dart';
import 'package:flutter_assessment_app/UI/dashboard/dashboard_controller.dart';
import 'package:flutter_assessment_app/UI/dashboard/dashboard_screen.dart';
import 'package:flutter_assessment_app/UI/search/search_screen.dart';
import 'package:flutter_assessment_app/routes.dart';
import 'package:get/get.dart';
import 'UI/onboarding/splash_screen/splash_controller.dart';
import 'UI/onboarding/splash_screen/splash_screen.dart';
import 'api/api_client.dart';


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
        getPages: [
          GetPage(
            name: Routes.splashScreen,
            page: () => const SplashScreen(),
            binding: BindingsBuilder.put(
                  () => SplashController(),
            ),
          ),
          GetPage(
            name: Routes.dashboard,
            page: () => const DashboardScreen(),
            binding: BindingsBuilder.put(
                  () => DashboardController(),
            ),
          ),
          GetPage(
            name: Routes.searchScreen,
            page: () => const SearchScreen(),
            ),
        ]);
  }
}