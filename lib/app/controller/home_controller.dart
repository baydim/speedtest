import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_speed_test/callbacks_enum.dart';
import 'package:internet_speed_test/internet_speed_test.dart';

class HomeController extends GetxController {
  InternetSpeedTest internetSpeedTest = InternetSpeedTest();
  final downloadSpeed = 0.0.obs;
  final uploadSpeed = 0.0.obs;
  String url = "https://www.citrahost.com/";
  final name = "".obs;
  final onProgress = false.obs;
  final transferRateConsume = 0.0.obs;

  download() async {
    name("Test Download");
    internetSpeedTest.startDownloadTesting(
      onDone: (double transferRate, SpeedUnit unit) {
        upload();
        log('the speedUnit ${unit.name}');
        transferRateConsume(transferRate);
        log('the transfer rate $transferRate');
        downloadSpeed(transferRate);
        onProgress(false);
      },
      onProgress: (double percent, double transferRate, SpeedUnit unit) {
        onProgress(true);
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
        onProgress(false);
        log('the speedUnit ${unit.name}');
        log('the transfer rate $transferRate');
        uploadSpeed(transferRate);
        Get.bottomSheet(
          Container(
            color: Colors.white,
            height: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text("Download Speed"),
                    Text("${downloadSpeed.value}"),
                  ],
                ),
                Column(
                  children: [
                    Text("Upload Speed"),
                    Text("${uploadSpeed.value}"),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      onProgress: (double percent, double transferRate, SpeedUnit unit) {
        onProgress(true);
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
