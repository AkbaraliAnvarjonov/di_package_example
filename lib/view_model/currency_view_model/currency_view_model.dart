import 'package:dio_package/data/api_servise/api_servise.dart';
import 'package:dio_package/data/repository/currency_repository.dart';
import 'package:flutter/cupertino.dart';

class CurrencyViewModel extends ChangeNotifier {
  CurrencyRepository currencyRepository;
  List? currencyList;
  String errorForUI = "";

  CurrencyViewModel({required this.currencyRepository});

  fetchCurrecyList() async {
    MyResponse response = await currencyRepository.getCurrensy();
    if (response.error.isEmpty) {
      currencyList = response.data;
    } else {
      errorForUI = response.error;
    }
    notifyListeners();
  }
}
