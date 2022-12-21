import 'package:dio/dio.dart';
import 'package:dio_package/data/api_servise/api_client.dart';
import 'package:dio_package/data/models/bank_models/expenses/transaction_model.dart';
import 'package:dio_package/data/models/bank_models/income_types/income_model.dart';
import 'package:dio_package/data/models/categories.dart';
import 'package:dio_package/data/models/products.dart';

class MyResponse {
  dynamic data;
  String error = "";

  MyResponse({this.data, required this.error});
}

class ApiSerice extends ApiClient {
  Future<MyResponse> getCategoryList() async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio.get("${dio.options.baseUrl}/categories");

      if (response.statusCode == 200) {
        myResponse.data =
            response.data.map((e) => Categories.fromJson(e)).toList();
      }
    } catch (error) {
      myResponse.error = error.toString();
    }
    return myResponse;
  }

  Future<MyResponse> getProductList(int id) async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response =
          await dio.get("${dio.options.baseUrl}/categories/$id");
      if (response.statusCode == 200) {
        myResponse.data =
            response.data.map((e) => CategoryId.fromJson(e)).toList();
      }

    } catch (error) {
      myResponse.error = error.toString();
    }
    return myResponse;
  }

  Future<MyResponse> getIncome() async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response =
          await dio.get("https://banking-api.free.mockoapp.net/income-types");
      if (response.statusCode == 200) {
        myResponse.data = (response.data as List)
            .map((e) => IncomeModel.fromJson(e))
            .toList();
      }
    } catch (e) {
      myResponse.error = e.toString();
    }

    return myResponse;
  }

  Future<MyResponse> getTransactions() async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio
          .get("https://banking-api.free.mockoapp.net/transactions-expenses");
      if (response.statusCode == 200) {
        myResponse.data = (response.data as List)
            .map((e) => TransactionModel.fromJson(e))
            .toList();
      }
    } catch (e) {
      myResponse.error = e.toString();
    }

    return myResponse;
  }
}
