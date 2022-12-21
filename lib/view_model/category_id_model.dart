import 'package:dio_package/data/api_servise/api_servise.dart';
import 'package:dio_package/data/models/products.dart';
import 'package:dio_package/data/repository/repository.dart';
import 'package:flutter/cupertino.dart';

class CategoryIdViewModel extends ChangeNotifier {
  Repository repository;
  MyResponse myResponse;

  CategoryIdViewModel({required this.repository, required this.myResponse});

  fetchCategoryIdList(int id) async {
    myResponse.data = await repository.getCategoryId(id);
    notifyListeners();
  }
}
