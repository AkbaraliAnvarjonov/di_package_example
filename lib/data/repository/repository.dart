import 'package:dio_package/data/api_servise/api_servise.dart';
import 'package:dio_package/data/models/categories.dart';
import 'package:dio_package/data/models/products.dart';

class Repository {
  ApiSerice apiSerice;
  Repository({required this.apiSerice});

  Future<List<Categories>?> getCategories() => apiSerice.getCategoryList();
  Future<List<CategoryId>?> getCategoryId(int id) =>
      apiSerice.getProductList(id);
}
