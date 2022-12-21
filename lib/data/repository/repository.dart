import 'package:dio_package/data/api_servise/api_servise.dart';

class Repository {
  ApiSerice apiSerice;
  Repository({required this.apiSerice});

  Future<MyResponse> getCategories() => apiSerice.getCategoryList();
  Future<MyResponse> getCategoryId(int id) =>
      apiSerice.getProductList(id);
}
