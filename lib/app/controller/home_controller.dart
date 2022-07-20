import 'dart:developer';

import 'package:get/get.dart';
import 'package:internet_speed_test/callbacks_enum.dart';
import 'package:internet_speed_test/internet_speed_test.dart';

class HomeController extends GetxController {
  InternetSpeedTest internetSpeedTest = InternetSpeedTest();
  String url = "https://www.citrahost.com/";
  final name = "".obs;

  final transferRateConsume = 0.0.obs;

  download() async {
    name("Test Download");
    internetSpeedTest.startDownloadTesting(
      onDone: (double transferRate, SpeedUnit unit) {
        upload();
        log('the speedUnit ${unit.name}');
        transferRateConsume(transferRate);
        log('the transfer rate $transferRate');
      },
      onProgress: (double percent, double transferRate, SpeedUnit unit) {
        log('the speedUnit ${unit.name}');
        transferRateConsume(transferRate);
        log('the transfer rate $transferRate, the percent $percent');
      },
      onError: (String errorMessage, String speedTestError) {
        log('the error $errorMessage');
      },
      // testServer: url,
    );
  }

  upload() async {
    name("Test Upload");
    internetSpeedTest.startUploadTesting(
      onDone: (double transferRate, SpeedUnit unit) {
        log('the speedUnit ${unit.name}');
        log('the transfer rate $transferRate');
      },
      onProgress: (double percent, double transferRate, SpeedUnit unit) {
        log('the speedUnit ${unit.name}');
        transferRateConsume(transferRate);
        log('the transfer rate $transferRate, the percent $percent');
      },
      onError: (String errorMessage, String speedTestError) {
        log('the error $errorMessage');
      },
      // testServer: url,
    );
  }

  @override
  void onClose() {
    super.onClose();
  }
}
