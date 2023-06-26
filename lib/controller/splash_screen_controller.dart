import 'dart:async';
import 'package:add_to_do/controller/sp_handler.dart';
import 'package:add_to_do/screens/home_page.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    SpHandler spHandler = SpHandler();
    //ListviewController listviewController = Get.put(ListviewController());
    timeDuration();
   // await spHandler.removeData();
    await spHandler.loadData();
  }

  timeDuration() async {
    //await loginController.removeToken();
    Timer(Duration(seconds: 3), () {
      Get.offAll(() => HomePage());
    });
  }
}
