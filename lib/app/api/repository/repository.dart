import '../provider/provider.dart';
import '../service/api_service.dart';
import '../url/app_url.dart';

class Repository extends Providers {
  Future<dynamic> requestUser() async => await commonApiCall(
      endPoint: AppUrl.userApi,
      method: Method.GET,
      map: {"results": 10}).then((value) => value);
}
