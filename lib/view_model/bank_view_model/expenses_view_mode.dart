import 'package:dio_package/data/api_servise/api_servise.dart';
import 'package:dio_package/data/models/bank_models/expenses/transaction_model.dart';
import 'package:dio_package/data/repository/bank_repository.dart';
import 'package:flutter/cupertino.dart';

class TransactionsViewModel extends ChangeNotifier{
  BankRepository bankRepository;
  List<TransactionModel>? transactionList;
  String errorForUI = "";

  TransactionsViewModel({required this.bankRepository});


fetchTransactionsList(int id) async {
    MyResponse response = await bankRepository.getExpenses();
    if (response.error.isEmpty) {
      transactionList = response.data;
    } else {
      errorForUI = response.error;
    }
    notifyListeners();
  }


}