import 'package:dio/dio.dart';
import 'package:dio_package/data/api_servise/api_client.dart';
import 'package:dio_package/data/api_servise/api_servise.dart';
import 'package:dio_package/data/models/currency_models/currency_model.dart';

class CurrensyApi extends ApiClient {
  Future<MyResponse> getCurrencyList() async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response =
          await dio.get("https://dynamic-view-api.free.mockoapp.net/dynamic");

      if (response.statusCode == 200) {
        myResponse.data = response.data["fields"]
            .map((e) => CurrencyModel.fromJson(e))
            .toList();
      }
    } catch (error) {
      myResponse.error = error.toString();
    }
    return myResponse;
  }
}
