import 'package:friends/app/api/repository/repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<dynamic> users = <dynamic>[].obs;

  requestUser() async {
    await Repository().requestUser().then((value) {
      if (value != null) {
        users.value = value['results'];
        users.refresh();
        update();
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    requestUser();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
