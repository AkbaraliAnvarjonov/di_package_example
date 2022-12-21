import 'package:dio_package/data/api_servise/api_servise.dart';

class BankRepository {
  ApiSerice apiSerice;
  BankRepository({required this.apiSerice});

  Future<MyResponse> getExpenses() => apiSerice.getTransactions();
  Future<MyResponse> getIncomeTypes() => apiSerice.getIncome();
}
