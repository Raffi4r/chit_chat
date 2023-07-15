import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var tabIndex = 0.obs;
  DateTime? lastPressedAt;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  Future<bool> onWillPop() async {
    if (lastPressedAt == null ||
        DateTime.now().difference(lastPressedAt!) > Duration(seconds: 2)) {
      lastPressedAt = DateTime.now();
      Get.snackbar(
        'Press again to exit',
        '',
        titleText: Text(
          'Press again to exit',
          textAlign: TextAlign.center,
        ),
        duration: Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 10,
        margin: EdgeInsets.only(bottom: 25, top: 100, left: 100, right: 100),
      );
      return false;
    }
    return true;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
