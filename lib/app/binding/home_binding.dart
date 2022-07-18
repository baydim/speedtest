import 'package:get/get.dart';
import 'package:speedtest/app/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    // TODO: implement dependencies
  }
}
