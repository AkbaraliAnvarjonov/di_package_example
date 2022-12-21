import 'package:dio_package/data/models/categories.dart';
import 'package:dio_package/data/repository/repository.dart';
import 'package:flutter/foundation.dart';

class CategoryViewModel extends ChangeNotifier {
  Repository repository;
  List<Categories>? categoryList;

  CategoryViewModel({required this.repository});

  fetchCategoryList() async {
    categoryList = await repository.getCategories();
    notifyListeners();
  }
}
