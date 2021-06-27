import 'package:loubank/redux/app_state.dart';
import 'package:loubank/redux/reducers/card_reducers.dart';
import 'package:loubank/redux/reducers/currency_reducers.dart';
import 'package:loubank/redux/reducers/loan_reducers.dart';
import 'package:redux/redux.dart';

Reducer<AppState> appReducer = combineReducers<AppState>([
  TypedReducer<AppState, dynamic>(generalReducer),
]);

AppState generalReducer(AppState state, dynamic action) {
  return AppState.initial().copyWith(
    cardState: cardReducers(state.cardState, action),
    loanState: loanReducers(state.loanState, action),
    currencyState: currencyReducers(state.currencyState, action),
  );
}
