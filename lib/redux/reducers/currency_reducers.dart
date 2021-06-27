import 'package:loubank/redux/actions/currency_actions.dart';
import 'package:loubank/redux/modals/currency_state.dart';
import 'package:redux/redux.dart';

final currencyReducers = combineReducers<CurrencyState>([
  TypedReducer<CurrencyState, GetCurrencyListSuccessAction>(
      _onGetLoanListSuccess),
]);

CurrencyState _onGetLoanListSuccess(
    CurrencyState state, GetCurrencyListSuccessAction action) {
  return CurrencyState(
    currencyList: action.currencyList,
    metalList: action.metalList,
  );
}
