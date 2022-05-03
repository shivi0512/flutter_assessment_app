import 'package:flutter_assessment_app/routes.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'UI/dashboard/dashboard_controller.dart';
import 'UI/dashboard/dashboard_screen.dart';
import 'UI/onboarding/intro_slider_view/intro_slider_controller.dart';
import 'UI/onboarding/intro_slider_view/intro_slider_screen.dart';
import 'UI/onboarding/splash_screen/splash_controller.dart';
import 'UI/onboarding/splash_screen/splash_screen.dart';
import 'UI/search/search_controller.dart';
import 'UI/search/search_screen.dart';

class Binders{
  static List<GetPage> dependencies() {
    return [
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
        name: Routes.introScreen,
        page: () => const IntroSliderScreen(),
        binding: BindingsBuilder.put(
              () => IntroSliderController(),
        ),
      ),
      GetPage(
        name: Routes.searchScreen,
        page: () => const SearchScreen(),
        binding: BindingsBuilder.put(
              () => SearchController(),
        ),),
    ];}
}