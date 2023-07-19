import '../callbacks/callbacks.dart';
import '../service/api_service.dart';

abstract class Providers implements CallBack {
  @override
  Future<dynamic> commonApiCall(
      {required String endPoint,
      required Method method,
      required Map<String, dynamic> map}) async {
    return await ApiService().request(endPoint, method, map);
  }
}
