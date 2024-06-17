


import 'package:get/get.dart';
import 'package:wltm_test/app/widgets/widgets.dart';

class GFunction {
  static void openModalLoading() {
    Get.dialog(const ModalLoading(), barrierDismissible: false);
  }

  static void closeModalLoading() {
    if(Get.isDialogOpen!) {
      Get.back();
    }
  }
}