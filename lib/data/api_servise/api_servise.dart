import 'package:dio/dio.dart';
import 'package:dio_package/data/api_servise/api_client.dart';
import 'package:dio_package/data/models/categories.dart';
import 'package:dio_package/data/models/products.dart';

class ApiSerice extends ApiClient {
  Future<List<Categories>?> getCategoryList() async {
    try {
      Response response =
          await dio.get("${dio.options.baseUrl}/categories");

      if (response.statusCode == 200) {
        return response.data.map((e) => Categories.fromJson(e)).toList();
      }
    } catch (error) {
      print(error.toString());
    }
    return null;
  }

  Future<List<CategoryId>?> getProductList(int id) async {

    try {
      Response response =
          await dio.get("${dio.options.baseUrl}/categories/$id");
      if (response.statusCode == 200) {
        return response.data.map((e) => CategoryId.fromJson(e)).toList();
      }
    
      return null;
    } catch (error) {
      print(error.toString());
    }
    return null;
  }
}
