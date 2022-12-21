import 'package:dio_package/data/api_servise/api_servise.dart';
import 'package:dio_package/data/models/products.dart';
import 'package:dio_package/data/repository/repository.dart';
import 'package:flutter/cupertino.dart';

class CategoryIdViewModel extends ChangeNotifier {
  Repository repository;
  List<CategoryId>? categoryId;
  String errorForUI = "";

  CategoryIdViewModel({required this.repository});

  fetchCategoryIdList(int id) async {
    MyResponse response = await repository.getCategoryId(id);

    if (response.error.isEmpty) {
      categoryId = response.data;
    } else {
      errorForUI = response.error;
    }
    notifyListeners();
  }
}
