import 'package:dio_package/data/models/products.dart';
import 'package:dio_package/data/repository/repository.dart';
import 'package:flutter/cupertino.dart';

class CategoryIdViewModel extends ChangeNotifier {
  Repository repository;
  List<CategoryId>? categoryId;

  CategoryIdViewModel({required this.repository}) {}

  fetchCategoryIdList(int id) async {
    categoryId = await repository.getCategoryId(id);
    notifyListeners();
  }
}
