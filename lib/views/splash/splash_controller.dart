import 'dart:async';

import 'package:get/get.dart';

import '../../routes/route_name.dart';

class SplashController extends GetxController {
  var counter = 3.obs;

  @override
  void onReady() {
    timer();
    super.onReady();
  }

  void timer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      counter--;
      if (counter.value == 0) {
        counter.value = 3;
        timer.cancel();
        Get.offAllNamed(RouteName.login);
      }
    });
  }
}
