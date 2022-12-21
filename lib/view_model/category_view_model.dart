import 'package:dio_package/data/api_servise/api_servise.dart';
import 'package:dio_package/data/models/categories.dart';
import 'package:dio_package/data/repository/repository.dart';
import 'package:flutter/foundation.dart';

class CategoryViewModel extends ChangeNotifier {
  Repository repository;
  MyResponse myResponse;

  CategoryViewModel({required this.repository, required this.myResponse});

  fetchCategoryList() async {
    myResponse.data = await repository.getCategories();
    notifyListeners();
  }
}
