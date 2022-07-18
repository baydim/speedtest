import 'dart:developer';

import 'package:get/get.dart';
import 'package:internet_speed_test/callbacks_enum.dart';
import 'package:internet_speed_test/internet_speed_test.dart';

class HomeController extends GetxController {
  final internetSpeedTest = InternetSpeedTest();

  double transferRateConsume = 0.0;

  download() async {
    internetSpeedTest.startDownloadTesting(
      onDone: (double transferRate, SpeedUnit unit) {
        log('the transfer rate $transferRate');
        // TODO: Change UI
      },
      onProgress: (double percent, double transferRate, SpeedUnit unit) {
        transferRateConsume = transferRate;
        update();
        log('the transfer rate $transferRate, the percent $percent');
        // TODO: Change UI
      },
      onError: (String errorMessage, String speedTestError) {
        // TODO: Show toast error
      },
    );
  }

  upload() async {
    internetSpeedTest.startUploadTesting(
      onDone: (double transferRate, SpeedUnit unit) {
        log('the transfer rate $transferRate');
      },
      onProgress: (double percent, double transferRate, SpeedUnit unit) {
        transferRateConsume = transferRate;
        update();
        log('the transfer rate $transferRate, the percent $percent');
      },
      onError: (String errorMessage, String speedTestError) {
        // TODO: Show toast error
      },
    );
  }
}
