import 'package:loubank/redux/modals/currency_state.dart';

class GetCurrencyListAction {}

class GetCurrencyListSuccessAction {
  List<Currency> currencyList;
  List<Currency> metalList;

  GetCurrencyListSuccessAction(
      {required this.currencyList, required this.metalList});
}

class GetCurrencyErrorAction {}
