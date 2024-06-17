import 'package:get/get.dart';

import '../modules/form_page/bindings/form_page_binding.dart';
import '../modules/form_page/views/form_page_view.dart';
import '../modules/home/bindings/home_page_binding.dart';
import '../modules/home/views/home.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.homePage;

  static final routes = [
    GetPage(
      name: _Paths.homePage,
      page: () => const HomePage(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: _Paths.formPage,
      page: () => const FormPageView(),
      binding: FormPageBinding(),
    ),
  ];
}
