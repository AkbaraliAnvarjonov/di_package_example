import 'package:dio_package/data/api_servise/api_servise.dart';
import 'package:dio_package/data/api_servise/currensy_servise.dart';

class CurrencyRepository {
  CurrensyApi apiSerice;
  CurrencyRepository({required this.apiSerice});

  Future<MyResponse> getCurrensy() => apiSerice.getCurrencyList();
}
