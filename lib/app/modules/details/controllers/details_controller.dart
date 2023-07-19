import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsController extends GetxController {
  RxMap<String, dynamic> user = <String, dynamic>{}.obs;
  userSetter({required Map<String, dynamic> data}) {
    user.value = data;
    user.refresh();
    update();
  }

  launchEmail() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: user['email'],
    );
    final String url = params.toString();

    if (await launchUrl(params)) {
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void onInit() {
    super.onInit();
    dynamic data = Get.arguments;
    if (data != null) {
      userSetter(data: data);
    }
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
