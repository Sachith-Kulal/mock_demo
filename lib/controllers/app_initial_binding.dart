
import 'package:get/get.dart';

import 'detail_controller.dart';
import 'home_controller.dart';

class AppInitialBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<HomeController>(() => HomeController(),fenix: true);
    Get.lazyPut<DetailController>(() => DetailController(),fenix: true);
  }


}