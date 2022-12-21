import 'package:dio_package/data/api_servise/api_servise.dart';
import 'package:dio_package/data/models/categories.dart';
import 'package:dio_package/data/repository/repository.dart';
import 'package:flutter/foundation.dart';

class CategoryViewModel extends ChangeNotifier {
  Repository repository;
  List<Categories>? categoryList;
  String errorForUI = "";

  CategoryViewModel({required this.repository, re});

  fetchCategoryList() async {
    MyResponse response = await repository.getCategories();
    if (response.error.isEmpty) {
      categoryList = response.data;
    } else {
      errorForUI = response.error;
    }
    notifyListeners();
  }
}
