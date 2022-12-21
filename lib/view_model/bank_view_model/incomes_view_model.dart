import 'package:dio_package/data/api_servise/api_servise.dart';
import 'package:dio_package/data/models/bank_models/income_types/income_model.dart';
import 'package:dio_package/data/repository/bank_repository.dart';
import 'package:flutter/cupertino.dart';

class IncomeTypesViewModel extends ChangeNotifier {
  BankRepository bankRepository;
  List<IncomeModel>? incomesList;
  String errorForUI = "";

  IncomeTypesViewModel({required this.bankRepository});

  fetchIncomesList() async {
    MyResponse response = await bankRepository.getExpenses();
    if (response.error.isEmpty) {
      incomesList = response.data;
    } else {
      errorForUI = response.error;
    }
    notifyListeners();
  }
}
